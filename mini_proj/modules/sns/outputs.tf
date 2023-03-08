output "sns_op" {
    value = aws_sns_topic.sns.*.arn
  
}