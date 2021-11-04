##########################################################################
# Route Table Association of the NAT Gateway route 
# table with the Private Subnet!
##########################################################################

resource "aws_route_table_association" "nat_gateway_route_association" {
  depends_on = [
    aws_route_table.nat_gateway_route
  ]

  subnet_id      = aws_subnet.private_subnet-1.id
  route_table_id = aws_route_table.nat_gateway_route.id
}
