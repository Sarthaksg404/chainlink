##########################################################################
# Internet gateway for VPC
##########################################################################

resource "aws_internet_gateway" "internet_gateway" {
  depends_on = [
    aws_vpc.vpc_network,
    aws_subnet.public_subnet-1,
    aws_subnet.private_subnet-1
  ]

  vpc_id = aws_vpc.vpc_network.id

  tags = {
    Name = "internet_gateway-${var.environment}-${var.application}"
  }
}
