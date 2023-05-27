resource "aws_vpc_ipam" "this" {
  operating_regions {
    region_name = var.region
  }
  tags = var.tags
}

resource "aws_vpc_ipam_pool" "this" {
  address_family = "ipv4"
  ipam_scope_id  = aws_vpc_ipam.this.private_default_scope_id
  locale         = var.region
  tags           = var.tags
}

resource "aws_vpc_ipam_pool_cidr" "this" {
  ipam_pool_id = aws_vpc_ipam_pool.this.id
  cidr         = var.cidr
}

resource "aws_vpc" "this" {
  ipv4_ipam_pool_id    = aws_vpc_ipam_pool.this.id
  ipv4_netmask_length  = 28
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = merge(
    var.tags,
    var.vpc_tags
  )

  depends_on = [
    aws_vpc_ipam_pool_cidr.this
  ]
}