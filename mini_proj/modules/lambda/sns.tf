resource "aws_sns_topic" "sns" {
    name = var.name
}
resource "aws_sns_topic_subscription" "snstopc" {
    topic_arn = aws_sns_topic.sns.arn
    protocol = "lambda"
    endpoint = aws_lambda_function.test_lambda.arn
  
}