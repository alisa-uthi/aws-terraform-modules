module "security-group" {
  count   = length(var.security_groups)
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.2"

  name        = var.security_groups[count.index].name
  description = var.security_groups[count.index].description
  tags        = var.security_groups[count.index].tags
  vpc_id      = var.security_groups[count.index].vpc_id

  computed_ingress_with_source_security_group_id = flatten([
    for key, value in var.security_groups[count.index].inbound_rules :
    {
      from_port                = value.from_port,
      to_port                  = value.to_port,
      protocol                 = value.protocol,
      description              = value.description,
      source_security_group_id = value.source_security_group_id,
      cidr_blocks              = value.cidr_blocks
    }
  ])
  number_of_computed_ingress_with_source_security_group_id = length(var.security_groups)
}