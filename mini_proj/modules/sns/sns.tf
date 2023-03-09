resource "aws_sns_topic" "sns" {
    count = length(var.name)
    name = var.name[count.index]
    kms_master_key_id = var.kms_op_arn
    tags = {
      Name = var.environment
    }
}
resource "aws_sns_topic_subscription" "snstopc" {
    topic_arn = aws_sns_topic.sns[1].arn
    protocol = "email"
    endpoint = "archanavadde88@gmail.com"
}
