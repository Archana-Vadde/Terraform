
resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.this.id

  queue {
    queue_arn     = var.sqs_op_arn
    events        = ["s3:ObjectCreated:*"]
  }
}