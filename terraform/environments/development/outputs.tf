output "CLUSTER_NAME" {
  value = module.cluster.cluster_name
}

output "APP_ECR_URL" {
  value = module.ecr.chainlink_test_ecr_url
}

output "POSTGRES_DB_INSTANCE_ENDPOINT" {
  value = module.rds.postgres_endpoint
}

output "REDIS_ENDPOINT" {
  value = module.elasticcache.redis_endpoint
}