resource "aws_eip" "this" {
  domain     = "vpc"
  tags       = var.tags
  depends_on = [aws_internet_gateway.this]
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.id
  subnet_id     = aws_subnet.public[0].id
  tags = merge(
    var.tags,
    var.nat_gateway_tags
  )

  depends_on = [aws_internet_gateway.this]
}