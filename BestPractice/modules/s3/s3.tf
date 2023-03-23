resource "aws_s3_bucket" "this" {
  count = var.create ? 1 : 0
  bucket = "${var.environment}-${var.name}"
  
  tags = merge({ "ResourceName" = var.environment }, var.tags)
}
  resource "aws_s3_bucket_public_access_block" "this" {
  bucket                  = aws_s3_bucket.this[0].id
  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls 
  restrict_public_buckets = var.restrict_public_buckets
  }
  resource "aws_s3_bucket_notification" "notification" {
  bucket = aws_s3_bucket.this[0].id

  queue {
    queue_arn     = var.sqs_arn
    events        = ["s3:ObjectCreated:*"]
  }
}

  resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this[0].bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.enable_encryption ? var.kms_master_key_id : null
      sse_algorithm     = "aws:kms"
    }
  }
}



