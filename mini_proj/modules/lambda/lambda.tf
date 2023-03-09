data "archive_file" "lambda" {
  type        = "zip"
  source_file = "${path.module}/../../python/process-sqs/process_sqs.py"
  output_path = "${path.module}/../../python/process-sqs/process_sqs.zip"
}
 # If the file is not in the current working directory you will need to include a
  # path.module in the filename.

resource "aws_lambda_function" "test_lambda" {
  count = length(var.name)
  function_name = var.name[count.index]
  filename      = data.archive_file.lambda.output_path
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "process_sqs.lambda_handler"

  source_code_hash = filebase64sha256(data.archive_file.lambda.output_path)

  runtime = var.runtime
  tags = {
    Environment = var.environment
  }
}

resource "aws_lambda_function_event_invoke_config" "example" {
  count = length(var.name)
  function_name = var.name[count.index]
  destination_config {
    on_failure {
      destination = var.f_sns_op_arn
    }

    on_success {
      destination = var.s_sns1_op_arn
    }
  }
}
