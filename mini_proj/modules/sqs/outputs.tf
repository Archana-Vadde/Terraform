output "sqs_output" {
    value = aws_sqs_queue.queue.arn
  
}