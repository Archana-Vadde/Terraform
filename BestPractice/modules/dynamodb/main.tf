provider "aws" {
  region = "eu-west-2"
}
resource "aws_dynamodb_table" "this" {
  count = var.create_table  ? 1 : 0

  name             = "${var.environment}-${var.name}"
  billing_mode     = var.billing_mode
  hash_key         = var.hash_key
  range_key        = var.range_key
  read_capacity    = var.read_capacity
  write_capacity   = var.write_capacity
  stream_enabled   = var.stream_enabled
  stream_view_type = var.stream_view_type
  

  ttl {
    enabled        = var.ttl_enabled
    attribute_name = var.ttl_attribute_name
  }

  point_in_time_recovery {
    enabled = var.point_in_time_recovery_enabled
  }

  dynamic "attribute" {
    for_each = var.attributes

    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }

  dynamic "local_secondary_index" {
    for_each = var.local_secondary_indexes

    content {
      name               = local_secondary_index.value.name
      range_key          = local_secondary_index.value.range_key
      projection_type    = local_secondary_index.value.projection_type
      non_key_attributes = lookup(local_secondary_index.value, "non_key_attributes", null)
    }
  }

  dynamic "global_secondary_index" {
    for_each = var.global_secondary_indexes

    content {
      name               = global_secondary_index.value.name
      hash_key           = global_secondary_index.value.hash_key
      projection_type    = global_secondary_index.value.projection_type
      range_key          = lookup(global_secondary_index.value, "range_key", null)
      read_capacity      = lookup(global_secondary_index.value, "read_capacity", null)
      write_capacity     = lookup(global_secondary_index.value, "write_capacity", null)
      non_key_attributes = lookup(global_secondary_index.value, "non_key_attributes", null)
    }
  }

  server_side_encryption {
    enabled     = var.server_side_encryption_enabled
    kms_key_arn = var.kms_master_key_id
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

  