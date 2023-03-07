resource "aws_s3_bucket" "this" {
  bucket = "${var.name}-s3"
  tags = merge({ "ResourceName" = "${var.name}-s3" }, var.tags)
}
  resource "aws_s3_bucket_public_access_block" "this" {
  bucket                  = aws_s3_bucket.this.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
  }
  resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.kms_op_arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_notification" "notification" {
  bucket = aws_s3_bucket.this.id

  queue {
    queue_arn     = var.sqs_op_arn
    events        = ["s3:ObjectCreated:*"]
  }
}

