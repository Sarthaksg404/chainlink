##########################################################################
# Private subnet
##########################################################################

resource "aws_subnet" "private_subnet-2" {
  depends_on = [
    aws_vpc.vpc_network
  ]

  vpc_id            = aws_vpc.vpc_network.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = var.availability_zone-1

  tags = {
    Name                                                                    = "private_subnet-3-${var.environment}-${var.application}"
    "kubernetes.io/cluster/${var.application}-${var.environment}" = "shared"
    "kubernetes.io/role/internal-elb"                                       = 1
  }
}
