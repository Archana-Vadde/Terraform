resource "aws_kms_key" "kms" {
  count = length(var.name)
  deletion_window_in_days = var.deletion_window_in_days
  tags = {
    name = "${var.name}-kms"
  }
  /*
  key_statements = [
    {
      sid = "policy"
      actions = [
        "kms:GenerateDataKey*",
        "kms:Decrypt"
      ]
      resources = ["*"]
      principals = [{
        type        = "Service"
        identifiers = ["*.amazonaws.com"]
      }]
    }
  ]
*/
}

resource "aws_kms_alias" "alias" {
  target_key_id = aws_kms_key.kms.key_id
  name          = "alias/${var.name}"
}
 




  
