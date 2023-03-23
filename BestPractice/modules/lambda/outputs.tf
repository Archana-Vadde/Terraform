output "lambdaa_arn" {
    value = aws_lambda_function.test_lambda[0].arn
}