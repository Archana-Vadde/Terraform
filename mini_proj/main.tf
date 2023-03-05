module "demosqs" {
  source               = "./modules/sqs"
  lambda_function_name = module.lambda.lambda_arn
  s3bucket             = module.s3demo.bucket_arn
}
module "lambda" {
  source = "./modules/lambda"

}
module "s3demo" {
  source      = "./modules/s3"
  queueoutput = module.demosqs.sqs_output

}

