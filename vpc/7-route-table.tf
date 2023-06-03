# Ref: https://docs.aws.amazon.com/vpc/latest/userguide/nat-gateway-scenarios.html

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  # For Private subnet to send all other subnet traffic to the NAT gateway
  # route {
  #   cidr_block     = "0.0.0.0/0"
  #   nat_gateway_id = aws_nat_gateway.this.id
  # }
  route = []

  tags = merge(
    var.tags,
    var.private_route_table_tags
  )

  # depends_on = [aws_nat_gateway.this]
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  # For Public subnet to send all other subnet traffic to the Internet gateway
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = merge(
    var.tags,
    var.public_route_table_tags
  )

  depends_on = [aws_internet_gateway.this]
}

resource "aws_route_table_association" "private" {
  count          = length(var.private_subnets)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
  depends_on     = [aws_route_table.private]
}

resource "aws_route_table_association" "public" {
  count          = length(var.public_subnets)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
  depends_on     = [aws_route_table.public]
}