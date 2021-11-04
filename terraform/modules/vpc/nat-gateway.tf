##########################################################################
# NAT Gateway
##########################################################################

resource "aws_nat_gateway" "nat_gateway" {
  depends_on = [
    aws_eip.nat_gateway_eip
  ]

  allocation_id = aws_eip.nat_gateway_eip.id
  subnet_id     = aws_subnet.public_subnet-1.id
  tags = {
    Name = "nat_gateway-${var.environment}-${var.application}"
  }
}
