module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.2"

  env  = var.env
  azs  = var.azs
  name = var.name
  cidr = var.cidr

  private_subnets          = [for k, v in var.azs : cidrsubnet(var.cidr, 8, k)]
  private_subnet_names     = var.private_subnet_names
  private_subnet_tags      = var.private_subnet_tags
  private_route_table_tags = var.private_route_table_tags

  public_subnets          = [for k, v in var.azs : cidrsubnet(var.cidr, 8, k + 4)]
  public_subnet_names     = var.public_subnet_names
  public_subnet_tags      = var.public_subnet_tags
  public_route_table_tags = var.public_route_table_tags

  igw_tags               = var.igw_tags
  enable_dns_hostnames   = var.enable_dns_hostnames
  enable_nat_gateway     = var.enable_nat_gateway
  nat_gateway_tags       = var.nat_gateway_tags
  one_nat_gateway_per_az = var.one_nat_gateway_per_az
}