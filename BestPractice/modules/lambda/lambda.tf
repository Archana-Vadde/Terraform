data "archive_file" "lambda" {
  type        = "zip"
  source_file = "${path.module}/../../python/process-sqs/process_sqs.py"
  output_path = "${path.module}/../../python/process-sqs/process_sqs.zip"
}
resource "aws_lambda_function" "test_lambda" {
  count = var.create-function ? 1 : 0
  function_name = "${var.environment}-${var.name}"
  filename      = data.archive_file.lambda.output_path
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = var.lambda_handler
  source_code_hash = filebase64sha256(data.archive_file.lambda.output_path)
  runtime = var.runtime
  environment {
    variables = {
      TABLE_NAME = var.dynamo_id
    }
  }
  tags = {
    Environment = var.environment
  
  

  }
}


resource "aws_lambda_function_event_invoke_config" "example" {
  count = var.create-event-invoke ? 1 : 0
  function_name = "${var.environment}-${var.name}"
  destination_config {
    on_failure {
      destination = var.sns_arn
    }

    on_success {
      destination = var.sns_arn
    }
    }
}

