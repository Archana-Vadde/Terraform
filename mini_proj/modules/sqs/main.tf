resource "aws_sqs_queue" "queue" {
  name                      = var.queue_name
  policy = data.aws_iam_policy_document.queue.json
  delay_seconds             = var.delay_seconds
  tags = {
    Environment = "dev"
  }
}
resource "aws_lambda_event_source_mapping" "example" {
  event_source_arn = aws_sqs_queue.queue.arn
  function_name    = var.lambda_function_name
}
data "aws_iam_policy_document" "queue" {
  statement {
    effect = "Allow"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions   = ["sqs:SendMessage"]
    resources = ["arn:aws:sqs:*:*:*"]

    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values   = [var.s3bucket]
    }
  }
}

