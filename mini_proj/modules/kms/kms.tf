resource "aws_kms_key" "kms" {
  deletion_window_in_days = var.deletion_window_in_days
  tags = {
    name = "${var.name}-kms"
  }
}
resource "aws_kms_alias" "alias" {
  target_key_id = aws_kms_key.kms.key_id
  name          = "alias/${var.name}-kms"
}
resource "aws_kms_key_policy" "example_key_policy" {
  key_id = aws_kms_key.kms.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid = "Enable IAM User Permissions"
        Effect = "Allow"
        Principal = {
          AWS = "*"
        }
        Action = [
          "kms:*"
        ]
        Resource = "*"
      }
    ]
  })
}
