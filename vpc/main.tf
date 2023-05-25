module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.2"

  azs = var.azs
  private_subnets = [for k, v in var.azs : cidrsubnet(var.cidr, 8, k)]
  public_subnets  = [for k, v in var.azs : cidrsubnet(var.cidr, 8, k + 4)]
}