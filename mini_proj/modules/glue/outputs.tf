output "glue_db_op" {
  value =  aws_glue_catalog_database.glue_database.*.name
}
output "s3_name" {
  value =  aws_glue_crawler.glue_crawler_s3.*.id
}

output "s3_db" {
  value =  aws_glue_crawler.glue_crawler_s3.*.database_name
}
output "glue_job_op" {
  value =  aws_glue_job.glue_job.*.id
}

output "dpu" {
  value =  aws_glue_job.glue_job.*.allocated_capacity
}
output "glue_trigger_op" {
  value = aws_glue_trigger.glue_job_trigger.*.name
}

output "type" {
  value =  aws_glue_trigger.glue_job_trigger.*.type
}

output "schedule" {
  value =  aws_glue_trigger.glue_job_trigger.*.schedule
}

output "actions" {
  value = aws_glue_trigger.glue_job_trigger.*.actions
}



