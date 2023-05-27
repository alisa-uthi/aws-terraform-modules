output "security_group_id" {
  description = "The ID of the Security group"
  value = aws_security_group.this.id
}

output "security_group_vpc_id" {
  description = "The ID of the VPC associated with Security group"
  value = aws_security_group.this.vpc_id
}