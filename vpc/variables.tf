variable "region" {
  description = "Region name"
  type        = string
  default     = "us-east-1"
}

variable "name" {
  description = "A map of tags to add to all resources"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "vpc_tags" {
  description = "VPC tags"
  type        = map(string)
}

variable "cidr" {
  description = "CIDR (Classless Inter-Domain Routing) for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "Availability zones for subnets"
  type        = list(string)
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
}

variable "private_subnet_names" {
  description = "Private subnet names"
  type        = list(string)
}

variable "public_subnet_names" {
  description = "Public subnet names"
  type        = list(string)
}

variable "private_subnet_tags" {
  description = "Private subnet tags"
  type        = map(string)
}

variable "public_subnet_tags" {
  description = "Public subnet tags"
  type        = map(string)
}

variable "private_route_table_tags" {
  description = "Tags for Private Route Table"
  type        = map(string)
}

variable "public_route_table_tags" {
  description = "Tags for Public Route Table"
  type        = map(string)
}

variable "enable_dns_hostnames" {
  description = "enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "igw_tags" {
  description = "Tags for Internet Gateway"
  type        = map(string)
}

variable "enable_nat_gateway" {
  description = "NAT Gateways for each private networks"
  type        = bool
  default     = true
}

variable "nat_gateway_tags" {
  description = "Tags for NAT Gateway"
  type        = map(string)
}

variable "one_nat_gateway_per_az" {
  description = "One NAT Gateway per Availability Zone"
  type        = bool
  default     = true
}

