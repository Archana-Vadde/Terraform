################################################################################
# Queue
################################################################################

output "queue_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = aws_sqs_queue.this[0].id
}

output "queue_arn" {
  description = "The ARN of the SQS queue"
  value       = aws_sqs_queue.this[0].arn
}

output "queue_url" {
  description = "Same as `queue_id`: The URL for the created Amazon SQS queue"
  value       = aws_sqs_queue.this[0].url
}

output "queue_name" {
  description = "The name of the SQS queue"
  value       = aws_sqs_queue.this[0].name
}

################################################################################
# Dead Letter Queue
################################################################################

output "dead_letter_queue_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = aws_sqs_queue.dlq[0].id
}

output "dead_letter_queue_arn" {
  description = "The ARN of the SQS queue"
  value       = aws_sqs_queue.dlq[0].arn
}

output "dead_letter_queue_url" {
  description = "Same as `dead_letter_queue_id`: The URL for the created Amazon SQS queue"
  value       = aws_sqs_queue.dlq[0].url
}

output "dead_letter_queue_name" {
  description = "The name of the SQS queue"
  value       = aws_sqs_queue.dlq[0].name
}