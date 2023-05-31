resource "aws_db_subnet_group" "this" {
  name        = var.db_subnet_group_name
  description = var.db_subnet_group_description
  subnet_ids  = var.subnet_ids
  tags = var.tags
}