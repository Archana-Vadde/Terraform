resource "aws_kms_key" "kms" {
  description             = "s3 bucket encryption key"
  deletion_window_in_days = var.deletion_window_in_days
  tags = {
    name = var.name
  }
}
resource "aws_kms_alias" "alias" {
  target_key_id = aws_kms_key.kms.key_id
  name          = "alias/${var.name}-kms"
}
