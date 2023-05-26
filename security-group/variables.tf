variable "security_groups" {
  description = "List of security group configurations"
  type = list(object({
    name        = string
    description = string
    tags        = map(string)
    vpc_id      = string
    inbound_rules = list(object({
      from_port                = number
      to_port                  = number
      protocol                 = string
      description              = string
      source_security_group_id = string
      cidr_blocks              = string
    }))
  }))

  default = [
    {
      name        = null
      description = null
      tags        = {}
      vpc_id      = null
      inbound_rules = [
        {
          from_port                = 80
          to_port                  = 80
          protocol                 = "tcp"
          description              = null
          source_security_group_id = null
          cidr_blocks              = "0.0.0.0/0"
        }
      ]
    }
  ]
}



# flatten([ for key, value in var.security_groups[0].inbound_rules : { from_port = value.from_port, description = value.description, source_security_group_id = value.source_security_group_id } ])
# [
#   {
#     "description" = "inbound rules descriptionnn"
#     "from_port" = 80
#     "source_security_group_id" = tolist([
#       "sg-id-1",
#       "sg-id-2",
#     ])
#   },
#   {
#     "description" = "inbound rules descriptionnn"
#     "from_port" = 443
#     "source_security_group_id" = tolist([
#       "sg-id-3",
#       "sg-id-4",
#     ])
#   },
# ]