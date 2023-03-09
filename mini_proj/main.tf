
module "kms_module" {
  source = "./modules/kms"
}


module "s3_module" {
  source     = "./modules/s3"
  kms_op_arn = module.kms_module.kms_op[0]
  sqs_op_arn = module.sqs_module.sqs_op[0]

}
module "sqs_module" {
  source = "./modules/sqs"
  kms_op_arn    = module.kms_module.kms_op[0]
  s3_op_arn     = module.s3_module.s3_op[0]
  lambda_op_arn = module.lambda_module.lambda_op[0]


}
module "lambda_module" {
  source        = "./modules/lambda"
  s_sns1_op_arn = module.sns_module.sns_op[0]
  f_sns_op_arn  = module.sns_module.sns_op[1]
}

module "sns_module" {
  source = "./modules/sns"
  kms_op_arn    = module.kms_module.kms_op[0]
  lambda_op_arn = module.lambda_module.lambda_op[0]
}
