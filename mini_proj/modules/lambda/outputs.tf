output "lambda_op" {
    value = aws_lambda_function.test_lambda.*.arn
}