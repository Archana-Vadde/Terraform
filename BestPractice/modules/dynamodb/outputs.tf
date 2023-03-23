output "dynamodb_table_arn" {
  description = "ARN of the DynamoDB table"
  value       = aws_dynamodb_table.this[0].arn
}

output "dynamodb_table_id" {
  description = "ID of the DynamoDB table"
  value       = aws_dynamodb_table.this[0].id
}
output "dynamodb-name" {
  value = aws_dynamodb_table.this[0].name
  
}

