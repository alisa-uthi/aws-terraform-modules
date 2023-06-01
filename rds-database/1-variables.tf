variable "env" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

#### Security Group ####
variable "security_group_name" {
  description = "Name of security group"
  type        = string
  default     = "security-group-dev"
}

variable "security_group_description" {
  description = "Description of security group"
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
  default     = null
}

variable "ingress_rules" {
  description = "Ingress rules"
  type = list(object({
    description        = string
    from_port          = number
    to_port            = number
    protocol           = string
    cidr_blocks        = optional(list(string))
    ipv6_cidr_blocks   = optional(list(string))
    security_group_ids = optional(list(string))
    self               = optional(bool)
  }))

  default = [
    {
      description        = null
      from_port          = null
      to_port            = null
      protocol           = null
      cidr_blocks        = null
      ipv6_cidr_blocks   = null
      security_group_ids = null
      self               = null
    }
  ]
}

variable "egress_rules" {
  description = "Egress rules"
  type = list(object({
    description        = string
    from_port          = number
    to_port            = number
    protocol           = string
    cidr_blocks        = optional(list(string))
    ipv6_cidr_blocks   = optional(list(string))
    security_group_ids = optional(list(string))
    self               = optional(bool)
  }))

  default = [
    {
      description        = null
      from_port          = null
      to_port            = null
      protocol           = null
      cidr_blocks        = null
      ipv6_cidr_blocks   = null
      security_group_ids = null
      self               = null
    }
  ]
}

#### DB Instance ####
variable "allocated_storage" {
  description = "The allocated storage in gibibytes"
  type        = number
  default     = null
}

variable "identifier" {
  description = "The name of the RDS instance"
  type        = string
  default     = null
}

variable "db_name" {
  description = "The name of the database to create when the DB instance is created"
  type        = string
  default     = "database_name"
}

variable "engine" {
  description = "The database engine to use"
  type        = string
  default     = null
}

variable "engine_version" {
  description = "The engine version to use"
  type        = string
  default     = null
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "availability_zone" {
  description = "The availability zone for the RDS instance"
  type        = string
  default     = "us-east-1a"
}

variable "username" {
  description = "Username for the master DB user"
  type        = string
  default     = null
}

variable "password" {
  description = "RDS root user password"
  type        = string
  default     = null
  sensitive   = true
}

variable "port" {
  description = "The port on which the DB accepts connections"
  type        = number
  default     = 3306
}

variable "manage_master_user_password" {
  description = "Set to true to allow RDS to manage the master user password in Secrets Manager. Cannot be set if password is provided"
  type        = bool
  default     = false
}

variable "deletion_protection" {
  description = "If the DB instance should have deletion protection enabled"
  type        = bool
  default     = true
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted"
  type        = bool
  default     = false
}

variable "final_snapshot_identifier" {
  description = "The name of your final DB snapshot when this DB instance is deleted. Must be provided if skip_final_snapshot is set to false"
  type        = string
  default     = null
}

variable "publicly_accessible" {
  description = "Bool to control if instance is publicly accessible"
  type        = bool
  default     = false
}

#### DB Subnet Group ####
variable "db_subnet_group_name" {
  description = "The name of the DB subnet group"
  type        = string
  default     = "security-group-dev"
}

variable "db_subnet_group_description" {
  description = "The description of the DB subnet group"
  type        = string
  default     = ""
}

variable "subnet_ids" {
  description = "A list of VPC subnet IDs"
  type        = list(string)
  default     = null
}
########

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
