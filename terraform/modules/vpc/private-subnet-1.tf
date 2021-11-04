##########################################################################
# Private subnet
##########################################################################

resource "aws_subnet" "private_subnet-1" {
  depends_on = [
    aws_vpc.vpc_network
  ]

  vpc_id            = aws_vpc.vpc_network.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = var.availability_zone-2

  tags = {
    Name                                                                    = "private_subnet-1-${var.environment}-${var.application}"
    "kubernetes.io/cluster/${var.application}-${var.environment}" = "shared"
    "kubernetes.io/role/internal-elb"                                       = 1
  }
}
