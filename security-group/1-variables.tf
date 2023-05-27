variable "env" {
  description = "Environment name"
  type = string
  default = "dev"
}

variable "name" {
  description = "Name of security group"
  type = string
  default = "security-group-dev"
}

variable "description" {
  description = "Description of security group"
  type = string
  default = ""
}

variable "ingress_rules" {
  description = "Ingress rules"
  type = list(object({
    description = string
    from_port = number
    to_port = number
    protocol = string
    cidr_blocks = list(string)
    ipv6_cidr_blocks = list(string)
  }))

  default = [ 
    {
      description = "Allow HTTP inbound traffic"
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = [ "0.0.0.0/0" ]
      ipv6_cidr_blocks = ["::/0"]
    },
    {
      description = "Allow HTTPS inbound traffic"
      from_port = 443
      to_port = 443
      protocol = "tcp"
      cidr_blocks = [ "0.0.0.0/0" ]
      ipv6_cidr_blocks = ["::/0"]
    } 
  ]
}

variable "egress_rules" {
  description = "Egress rules"
  type = list(object({
    description = string
    from_port = number
    to_port = number
    protocol = string
    cidr_blocks = list(string)
    ipv6_cidr_blocks = list(string)
  }))

  default = [ 
    {
      description = "Allow all traffic"
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = [ "0.0.0.0/0" ]
      ipv6_cidr_blocks = ["::/0"]
    } 
  ]
}

variable "tags" {
  description = "Tags of Secuity group"
  type = map(any)
  default = {}
}
