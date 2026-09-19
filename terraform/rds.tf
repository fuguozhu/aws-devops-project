resource "aws_db_subnet_group" "rds" {
  name        = "aws-devops-rds-subnet-group"
  description = "Private subnet group for RDS"

  subnet_ids = [
    aws_subnet.private_1a.id,
    aws_subnet.private_1c.id
  ]

  tags = {
    Name = "aws-devops-rds-subnet-group"
  }
}

resource "aws_db_instance" "postgres" {
  identifier = "aws-devops-rds"

  engine         = "postgres"
  instance_class = "db.t3.micro"

  allocated_storage     = 20
  max_allocated_storage = 20
  storage_type          = "gp3"
  storage_encrypted     = true

  db_name  = "devopsdb"
  username = "postgres"

  manage_master_user_password = true

  db_subnet_group_name = aws_db_subnet_group.rds.name
  vpc_security_group_ids = [
    aws_security_group.rds.id
  ]

  publicly_accessible = false

  backup_retention_period = 1

  multi_az = false

  deletion_protection = false
  skip_final_snapshot = true

  tags = {
    Name = "aws-devops-rds"
  }
}