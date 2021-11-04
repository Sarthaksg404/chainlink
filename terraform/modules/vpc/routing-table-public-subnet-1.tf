##########################################################################
# Routing table association for internet gateway with public subnet
##########################################################################

resource "aws_route_table_association" "internet_gateway_route_association" {

  depends_on = [
    aws_vpc.vpc_network,
    aws_subnet.public_subnet-1,
    aws_route_table.internet_gateway_route
  ]

  subnet_id      = aws_subnet.public_subnet-1.id
  route_table_id = aws_route_table.internet_gateway_route.id
}
