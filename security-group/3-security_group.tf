resource "aws_security_group" "this" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description      = ingress.value["description"]
      from_port        = ingress.value["from_port"]
      to_port          = ingress.value["to_port"]
      protocol         = ingress.value["protocol"]
      cidr_blocks      = ingress.value["cidr_blocks"] ? ingress.value["cidr_blocks"] : null
      ipv6_cidr_blocks = ingress.value["ipv6_cidr_blocks"] ? ingress.value["ipv6_cidr_blocks"] : null
      security_groups  = ingress.value["security_group_ids"] ? ingress.value["security_group_ids"] : null
      self             = ingress.value["self"] ? ingress.value["self"] : false
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      from_port        = egress.value["from_port"]
      to_port          = egress.value["to_port"]
      protocol         = egress.value["protocol"]
      cidr_blocks      = egress.value["cidr_blocks"] ? egress.value["cidr_blocks"] : null
      ipv6_cidr_blocks = egress.value["ipv6_cidr_blocks"] ? egress.value["ipv6_cidr_blocks"] : null
      security_groups  = egress.value["security_group_ids"] ? egress.value["security_group_ids"] : null
      self             = egress.value["self"] ? egress.value["self"] : false
    }
  }

  tags = var.tags
}