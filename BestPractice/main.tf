# for multiple environments use .tfvars files 
#to overwrite module variable defalut values .tfvars files can be used
#command terraform apply -var-file="dev.tfvars" --auto-approve
#locals..> can use the name multiple times within a module instead of repeating the expression.

locals {
  tags = {
    Project     = var.project
    createdby   = var.createdby
    environment = var.environment
    
  }
}
module "kms_module" {
  source = "./modules/kms"
  tags = local.tags
}
module "s3_module" {
  source = "./modules/s3"
  kms_master_key_id = module.kms_module.key_arn
  sqs_arn = module.sqs_module.queue_arn
  
}
module "sqs_module" {
  source = "./modules/sqs"
  tags = local.tags
  kms_master_key_id = module.kms_module.key_arn
  lambda_arn = module.lambda_module.lambdaa_arn
  s3_arn = module.s3_module.s3_arn
}

module "lambda_module" {
  source = "./modules/lambda"
  sns_arn = module.sns_module.sns_arn
  dynamo_id = module.dynamodb_module.dynamodb-name
  
}

module "sns_module" {
  source = "./modules/sns"
  tags = local.tags
  kms_master_key_id = module.kms_module.key_arn
  lambda_endpoint = module.lambda_module.lambdaa_arn
  sqs_endpoint = module.sqs_module.queue_arn
  

  
}

module "dynamodb_module" {
  source = "./modules/dynamodb"
  tags = local.tags
  server_side_encryption_kms_key_arn = module.kms_module.key_arn
  
}
module "redshift_module" {
  source = "./modules/redshift"
  tags = local.tags
}

