
module "rds_postgres" {
  source  = "terraform-aws-modules/rds/aws"
  version = "3.1.0"

  identifier = var.db_identifier

  engine         = "postgres"
  engine_version = "10.15"

  instance_class    = var.db_instance_class
  allocated_storage = 5
  storage_encrypted = false

  name     = var.db_name
  username = var.db_username
  password = var.db_password
  port     = var.port

  iam_database_authentication_enabled = true

  vpc_security_group_ids = [aws_security_group.allow-rds-sg.id]

  maintenance_window     = "Mon:00:00-Mon:03:00"
  backup_window          = "03:00-06:00"
  monitoring_interval    = "30"
  monitoring_role_name   = "MyRDSMonitoringRole"
  create_monitoring_role = true

  tags = {
    Owner       = "postgres"
    Environment = var.environment
  }

  subnet_ids                = [var.private-subnet-1-id, var.private-subnet-2-id]
  family                    = "postgres10"
  major_engine_version      = "10"
  final_snapshot_identifier = var.application
  deletion_protection       = false

}
