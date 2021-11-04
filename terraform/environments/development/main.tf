module "vpc" {
  source              = "../../modules/vpc"
  environment         = var.environment
  region              = var.region
  availability_zone-1 = var.availability_zone-1
  availability_zone-2 = var.availability_zone-2
  application         = var.application
}

module "ecr" {
  source = "../../modules/ecr"
}

module "cluster" {
  source              = "../../modules/cluster"
  environment         = var.environment
  private_subnet-1_id = module.vpc.private_subnet-1_id
  public_subnet-1_id  = module.vpc.public_subnet-1_id
  vpc_id              = module.vpc.vpc_id
  application         = var.application
  region              = var.region
}

module "rds" {
  source              = "../../modules/rds"
  environment         = var.environment
  application         = var.application
  region              = var.region
  db_username         = var.db_username
  db_password         = var.db_password
  port                = var.db_port
  db_instance_class   = var.db_instance_class
  db_name             = var.db_name
  db_identifier       = var.db_identifier
  vpc-id              = module.vpc.vpc_id
  private-subnet-1-id = module.vpc.private_subnet-1_id
  private-subnet-2-id = module.vpc.private_subnet-2_id
}

module "elasticcache" {
  source              = "../../modules/elasticcache"
  redis_name          = var.redis_name
  environment         = var.environment
  application         = var.application
  region              = var.region
  vpc-id              = module.vpc.vpc_id
  redis_password      = var.redis_password
  private-subnet-1-id = module.vpc.private_subnet-1_id
  machine_type        = "cache.t2.micro"
  redis_port          = var.redis_port
}
