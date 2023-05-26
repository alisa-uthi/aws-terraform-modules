output "security_group_id" {
  value = toset([
    for value in module.security-group : value.security_group_id
  ])
}

output "security_group_name" {
  value = toset([
    for value in module.security-group : value.security_group_name
  ])
}

output "security_group_vpc_id" {
  value = toset([
    for value in module.security-group : value.security_group_vpc_id
  ])
}