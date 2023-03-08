resource "aws_kms_key" "kms" {
  count = length(var.name)
  name = var.name[count.index]
  deletion_window_in_days = var.deletion_window_in_days
  tags = {
    name = "kms"
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
  target_key_id = aws_kms_key.kms[0].key_id
  name          = "alias/${var.name[0]}"
}
 




  
