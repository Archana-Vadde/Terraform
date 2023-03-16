resource "aws_dynamodb_table" "this" {
  count = var.create_table ? 1 : 0
  name         = var.db_table_name
  hash_key     = var.hash_key  
  billing_mode = var.billing_mode 
  
  attribute {
    name = var.attr_name 
    type = var.attr_type 
    
  }
  tags = merge({ "ResourceName" = var.db_table_name }, var.tags)
  server_side_encryption {
    enabled     = var.server_side_encryption_enabled
    kms_key_arn = var.server_side_encryption_kms_key_arn
  } 
}
resource "aws_dynamodb_table_item" "example" {
  count = var.dynamodb_item_create ? 1:0
  table_name = aws_dynamodb_table.this[0].name
  hash_key   = aws_dynamodb_table.this[0].hash_key

  item = <<ITEM
{
  "UserId": {"S": "something"},
  "one": {"N": "11111"},
  "two": {"N": "22222"},
  "three": {"N": "33333"},
  "four": {"N": "44444"}
}
ITEM
}

  