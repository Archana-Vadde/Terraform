resource "aws_sqs_queue" "queue" {
  name                      = "${var.name}-sqs"
  policy = data.aws_iam_policy_document.queue.json
  delay_seconds             = var.delay_seconds
  message_retention_seconds   = var.retention_period
  visibility_timeout_seconds  = var.visibility_timeout
  #kms_master_key_id                 = var.kms_op_arn
  redrive_policy              = jsonencode({
                                    "deadLetterTargetArn" = aws_sqs_queue.deadletter_queue.arn,
                                    "maxReceiveCount" = var.receive_count
                                })
  tags = {
    Environment = "dev"
  }
  
}
resource "aws_sqs_queue" "deadletter_queue" {
  name                        = "${var.name}-DLQ"
  message_retention_seconds   = var.retention_period
  visibility_timeout_seconds  = var.visibility_timeout
}

data "aws_iam_policy_document" "queue" {
  statement {
    effect = "Allow"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions   = ["sqs:sendMessage"]
    resources = ["arn:aws:sqs:*:*:*"]

    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values   = [var.s3_op_arn]
    }
  }
}

resource "aws_lambda_event_source_mapping" "example" {
  event_source_arn = aws_sqs_queue.queue.arn
  function_name    = var.lambda_op_arn
}