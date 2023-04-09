resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds_sub"
  subnet_ids = var.rds_sub_ids

  tags = {
    Name = "RDS Subnet Group"
  }
}

resource "aws_db_instance" "threetierrds"{
  allocated_storage     = var.all_str
  max_allocated_storage = var.max_all_str
  engine                = var.rds_engine
  engine_version        = var.rds_engine_ver
  multi_az              = var.multi_azs
  instance_class        = var.rds_class
  db_name               = "mydb"
  username              = "admin"
  password              = var.database_upasswd
  #backup_retention_period = 3
  #preferred_backup_window = "07:00-09:00"
  vpc_security_group_ids  = var.vpc_sg
  storage_encrypted       = var.strg_enc
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.id
  iam_database_authentication_enabled = var.iam_auth
  skip_final_snapshot   = var.skip_final
}