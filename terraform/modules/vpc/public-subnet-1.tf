##########################################################################
# Public Subnet
##########################################################################

resource "aws_subnet" "public_subnet-1" {

  depends_on = [
    aws_vpc.vpc_network
  ]

  vpc_id                  = aws_vpc.vpc_network.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = var.availability_zone-1
  map_public_ip_on_launch = true

  tags = {
    Name                                                                    = "public_subnet-1-${var.environment}-${var.application}"
    "kubernetes.io/cluster/${var.application}-${var.environment}" = "shared"
    "kubernetes.io/role/elb"                                                = 1
  }
}
