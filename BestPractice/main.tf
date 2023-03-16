module "sns_module" {
  source = "./modules/sns"
  
}
module "sqs_module" {
  source = "./modules/sqs"
}
module "dynamodb_module" {
  source = "./modules/dynamodb"
  
}

module "kms_module" {
  source = "./modules/kms"
}

