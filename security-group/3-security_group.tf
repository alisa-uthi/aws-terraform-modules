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
      cidr_blocks      = ingress.value["cidr_blocks"] == null || length(ingress.value["cidr_blocks"]) == 0 ? null : ingress.value["cidr_blocks"] 
      ipv6_cidr_blocks = ingress.value["ipv6_cidr_blocks"] == null || length(ingress.value["ipv6_cidr_blocks"]) == 0 ? null : ingress.value["ipv6_cidr_blocks"] 
      security_groups  = ingress.value["security_group_ids"] == null || length(ingress.value["security_group_ids"]) == 0 ? null : ingress.value["security_group_ids"] 
      self             = ingress.value["self"] == null ? false : ingress.value["self"]
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      from_port        = egress.value["from_port"]
      to_port          = egress.value["to_port"]
      protocol         = egress.value["protocol"]
      cidr_blocks      = egress.value["cidr_blocks"] == null || length(egress.value["cidr_blocks"]) == 0 ? null : egress.value["cidr_blocks"] 
      ipv6_cidr_blocks = egress.value["ipv6_cidr_blocks"] == null || length(egress.value["ipv6_cidr_blocks"]) == 0 ? null : egress.value["ipv6_cidr_blocks"] 
      security_groups  = egress.value["security_group_ids"] == null || length(egress.value["security_group_ids"]) == 0 ? null : egress.value["security_group_ids"] 
      self             = egress.value["self"] == null ? false : egress.value["self"]
    }
  }

  tags = var.tags
}