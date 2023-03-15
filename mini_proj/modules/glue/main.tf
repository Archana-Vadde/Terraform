resource "aws_glue_catalog_database" "glue_database" {
  count = var.dbcreate ? 1 : 0

  name = "${var.name}-db"

  description  = var.description
}
##########################################################
resource "aws_glue_crawler" "glue_crawler" {
  count = var.crawlercreate ? 1 : 0

  name          = "${var.name}-crawler"
  database_name = var.db
  role          = var.role

  schedule     = var.schedule
 
  s3_target {
    path = var.s3_path
  }
}
##########################################################
resource "aws_glue_job" "glue_job" {
  count = var.jobcreate ? 1 : 0

  name               = "${var.name}-job"
  role_arn           = var.role_arn
  connections        = ["${var.connections}"]
  allocated_capacity = var.dpu

  command {
    script_location = var.script_location
  }
}
##############################################################
resource "aws_glue_trigger" "glue_job_trigger" {
  count = var.trigger-create ? 1 : 0

  name     = "${var.name}-trigger"
  schedule = var.schedule
  type     = var.type

  enabled     = var.enabled
  

  actions {
    job_name  = var.job_name
    arguments = var.arguments
    timeout   = var.timeout
  }
}
