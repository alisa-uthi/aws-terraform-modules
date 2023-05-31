resource "aws_db_instance" "this" {
  allocated_storage    = var.allocated_storage
  identifier           = var.identifier
  db_name              = var.db_name
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  availability_zone    = var.availability_zone
  db_subnet_group_name = aws_db_subnet_group.this.name

  username                            = var.username
  password                            = var.password
  port                                = var.port
  manage_master_user_password         = var.manage_master_user_password
  iam_database_authentication_enabled = true
  storage_encrypted                   = true

  vpc_security_group_ids = ["${aws_security_group.rds.id}"]

  deletion_protection = var.deletion_protection

  skip_final_snapshot       = var.skip_final_snapshot
  final_snapshot_identifier = var.final_snapshot_identifier

  tags       = var.tags
  depends_on = [aws_security_group.rds, aws_db_subnet_group.this]
}