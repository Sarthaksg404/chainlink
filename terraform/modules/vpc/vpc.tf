##########################################################################
# VPC network
##########################################################################

resource "aws_vpc" "vpc_network" {

  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "vpc-${var.environment}-${var.application}"
  }
}
