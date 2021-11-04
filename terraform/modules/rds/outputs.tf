output "postgres_endpoint" {
  value = module.rds_postgres.db_instance_endpoint
}