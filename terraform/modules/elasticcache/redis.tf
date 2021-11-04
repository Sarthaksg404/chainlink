module "elasticache_redis" {
  source = "cloudposse/elasticache-redis/aws"

  # security_groups = [aws_security_group.allow-redis-sg.id]

  name                       = var.redis_name
  vpc_id                     = var.vpc-id
  subnets                    = [var.private-subnet-1-id]
  instance_type              = var.machine_type
  apply_immediately          = true
  automatic_failover_enabled = false
  engine_version             = "5.0.6"
  family                     = "redis5.0"
  at_rest_encryption_enabled = false
  transit_encryption_enabled = false
  auth_token                 = var.redis_password
}