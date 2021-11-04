##########################################################################
# Elastic IP for the NAT Gateway!
##########################################################################

resource "aws_eip" "nat_gateway_eip" {
  depends_on = [
    aws_route_table_association.internet_gateway_route_association
  ]
  tags = {
    Name = "nat_gateway_eip-${var.environment}-${var.application}"
  }
  vpc = true
}
