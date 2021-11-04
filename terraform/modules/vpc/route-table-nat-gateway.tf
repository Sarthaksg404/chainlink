##########################################################################
# Route Table for the Nat Gateway
##########################################################################

resource "aws_route_table" "nat_gateway_route" {
  depends_on = [
    aws_nat_gateway.nat_gateway
  ]

  vpc_id = aws_vpc.vpc_network.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "nat_gateway_route-${var.environment}-${var.application}"
  }

}
