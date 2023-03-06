module "s3demo" {
  source      = "./modules/s3"
  queueoutput = module.demosqs.sqs_output

}
module "demosqs" {
  source               = "./modules/sqs"
  lambda_function_name = module.lambda.lambda_arn
  s3bucket             = module.s3demo.bucket_arn
  #kmskeyarn = module.s3demo.kms_op
}
module "lambda" {
  source = "./modules/lambda"
  f_l_n = module.demosqs.sqs_output
  #kmskeyarn = module.s3demo.kms_op
}
