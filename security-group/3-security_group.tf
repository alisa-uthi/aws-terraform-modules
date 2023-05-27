resource "aws_security_group" "this" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.this.id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description      = ingress_rules.value["description"]
      from_port        = ingress_rules.value["from_port"]
      to_port          = ingress_rules.value["to_port"]
      protocol         = ingress_rules.value["protocol"]
      cidr_blocks      = ingress_rules.value["cidr_blocks"]
      ipv6_cidr_blocks = ingress_rules.value["ipv6_cidr_blocks"]
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      from_port        = egress_rules.value["from_port"]
      to_port          = egress_rules.value["to_port"]
      protocol         = egress_rules.value["protocol"]
      cidr_blocks      = egress_rules.value["cidr_blocks"]
      ipv6_cidr_blocks = egress_rules.value["ipv6_cidr_blocks"]
    }
  }

  tags = var.tags

  depends_on = [ aws_vpc.this ]
}