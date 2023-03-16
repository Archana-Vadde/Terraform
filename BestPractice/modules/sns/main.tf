data "aws_caller_identity" "current" {}

################################################################################
# Topic
################################################################################

resource "aws_sns_topic" "this" {
  count = var.create ? 1 : 0
  name        = var.use_name_prefix ? null : "${var.environment}-${var.name}"
  name_prefix = var.use_name_prefix ? var.environment : null
  kms_master_key_id = var.enable_encryption ? var.kms_master_key_id : null
  policy = var.create_topic_policy ? null : var.topic_policy
  tags = var.tags
}

################################################################################
# Topic Policy
################################################################################
resource "aws_sns_topic_policy" "this" {
  count = var.create && var.create_topic_policy ? 1 : 0

  arn    = aws_sns_topic.this[0].arn
  policy = data.aws_iam_policy_document.this[0].json
}

data "aws_iam_policy_document" "this" {
  count = var.create && var.create_topic_policy ? 1 : 0

  source_policy_documents   = var.source_topic_policy_documents
  override_policy_documents = var.override_topic_policy_documents

  dynamic "statement" {
    for_each = var.enable_default_topic_policy ? [1] : []

    content {
      sid = "__default_statement_ID"
      actions = [
        "sns:Subscribe",
        "sns:SetTopicAttributes",
        "sns:RemovePermission",
        "sns:Receive",
        "sns:Publish",
        "sns:ListSubscriptionsByTopic",
        "sns:GetTopicAttributes",
        "sns:DeleteTopic",
        "sns:AddPermission",
      ]
      effect    = "Allow"
      resources = [aws_sns_topic.this[0].arn]

      principals {
        type        = "AWS"
        identifiers = ["*"]
      }

      condition {
        test     = "StringEquals"
        values   = [data.aws_caller_identity.current.account_id]
        variable = "AWS:SourceOwner"
      }
    }
  }

  dynamic "statement" {
    for_each = var.topic_policy_statements

    content {
      sid         = try(statement.value.sid, statement.key)
      actions     = try(statement.value.actions, null)
      not_actions = try(statement.value.not_actions, null)
      effect      = try(statement.value.effect, null)
      # This avoids the chicken vs the egg scenario since its embedded and can reference the topic
      resources     = try(statement.value.resources, [aws_sns_topic.this[0].arn])
      not_resources = try(statement.value.not_resources, null)

      dynamic "principals" {
        for_each = try(statement.value.principals, [])

        content {
          type        = principals.value.type
          identifiers = principals.value.identifiers
        }
      }

      dynamic "not_principals" {
        for_each = try(statement.value.not_principals, [])

        content {
          type        = not_principals.value.type
          identifiers = not_principals.value.identifiers
        }
      }

      dynamic "condition" {
        for_each = try(statement.value.conditions, [])

        content {
          test     = condition.value.test
          values   = condition.value.values
          variable = condition.value.variable
        }
      }
    }
  }
}

################################################################################
# Subscription(s)
################################################################################

resource "aws_sns_topic_subscription" "lambda_subscription" {
  count = var.enable_lambda_subscribe ? 1 : 0

  topic_arn = aws_sns_topic.this[0].arn
  protocol = "lambda"
  endpoint = var.lambda_endpoint
}

resource "aws_sns_topic_subscription" "email_subscription" {
  count = var.enable_email_subscribe ? 1 : 0

  topic_arn = aws_sns_topic.this[0].arn
  protocol = "email"
  endpoint = var.email_endpoint
}

resource "aws_sns_topic_subscription" "sqs_subscription" {
  count = var.enable_sqs_subscribe ? 1 : 0

  topic_arn = aws_sns_topic.this[0].arn
  protocol = "sqs"
  endpoint = var.sqs_endpoint
}