##########################################################################
# Routing table for public subnet
##########################################################################

resource "aws_route_table" "internet_gateway_route" {
  depends_on = [
    aws_vpc.vpc_network,
    aws_internet_gateway.internet_gateway
  ]

  vpc_id = aws_vpc.vpc_network.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "internet_gateway_route-${var.environment}-${var.application}"
  }
}
