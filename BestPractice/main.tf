# for multiple environments use .tfvars files 
#command terraform apply -var-file="dev.tfvars" --auto-approve

locals {
  tags = {
    Project     = var.project
    createdby   = var.createdby
    
  }
}
module "kms_module" {
  source = "./modules/kms"
  tags = local.tags
}

module "sns_module" {
  source = "./modules/sns"
  tags = local.tags
  kms_master_key_id = module.kms_module.key_arn
  
}
module "sqs_module" {
  source = "./modules/sqs"
  tags = local.tags
  kms_master_key_id = module.kms_module.key_arn

}
module "dynamodb_module" {
  source = "./modules/dynamodb"
  tags = local.tags
  server_side_encryption_kms_key_arn = module.kms_module.key_arn
  
}


