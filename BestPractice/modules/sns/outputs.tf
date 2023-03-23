################################################################################
# Topic
################################################################################

output "sns_arn" {
  description = "The ARN of the SNS topic, as a more obvious property (clone of id)"
  value       = aws_sns_topic.this[0].arn
}

output "topic_id" {
  description = "The ARN of the SNS topic"
  value       = aws_sns_topic.this[0].id
}

output "topic_name" {
  description = "The name of the topic"
  value       = aws_sns_topic.this[0].name
}

output "topic_owner" {
  description = "The AWS Account ID of the SNS topic owner"
  value       = aws_sns_topic.this[0].owner
}


