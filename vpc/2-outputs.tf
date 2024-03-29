output "env" {
  description = "Environment"
  value       = var.env
}

output "region" {
  description = "Region"
  value       = var.region
}

output "availability_zones" {
  description = "List of availability zones"
  value       = var.availability_zones
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.this.id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.this.cidr_block
}

output "vpc_name" {
  description = "The name of the VPC"
  value       = lookup(var.vpc_tags, "Name", "main-vpc")
}

output "private_subnet_ids" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.private[*].id
}

output "public_subnet_ids" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public[*].id
}

output "private_subnets" {
  description = "List of private subnets"
  value       = var.private_subnets
}

output "public_subnets" {
  description = "List of public subnets"
  value       = var.public_subnets
}

# output "nat_gateway_id" {
#   description = "The ID of the NAT Gateway"
#   value       = aws_nat_gateway.this.id
# }

output "igt_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.this.id
}

output "private_route_table_id" {
  description = "The ID of the Private Route Table"
  value       = aws_route_table.private.id
}

output "public_route_table_id" {
  description = "The ID of the Public Route Table"
  value       = aws_route_table.public.id
}

output "private_route_table_associate_ids" {
  description = "List of IDs of the Private Route Table Association"
  value       = aws_route_table_association.private[*].id
}

output "public_route_table_associate_ids" {
  description = "List of IDs of the Public Route Table Association"
  value       = aws_route_table_association.public[*].id
}

output "kubernetes_cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = var.kubernetes_cluster_name
}