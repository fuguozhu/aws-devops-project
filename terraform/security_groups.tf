resource "aws_security_group" "alb" {
  name        = "aws-devops-alb-sg"
  description = "Security group for AWS DevOps Application Load Balancer"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "aws-devops-alb-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "alb_http" {
  security_group_id = aws_security_group.alb.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"

  description = "Allow HTTP from Internet"
}

resource "aws_vpc_security_group_egress_rule" "alb_all" {
  security_group_id = aws_security_group.alb.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"

  description = "Allow all outbound traffic"
}

resource "aws_security_group" "web" {
  name        = "aws-devops-web-sg"
  description = "Security group for AWS DevOps web server"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "aws-devops-web-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "web_http_from_alb" {
  security_group_id = aws_security_group.web.id

  referenced_security_group_id = aws_security_group.alb.id

  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"

  description = "Allow HTTP from ALB"
}

resource "aws_vpc_security_group_egress_rule" "web_all" {
  security_group_id = aws_security_group.web.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"

  description = "Allow all outbound traffic"
}

resource "aws_security_group" "rds" {
  name        = "aws-devops-rds-sg"
  description = "RDS security group"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "aws-devops-rds-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "rds_postgres_from_web" {
  security_group_id = aws_security_group.rds.id

  referenced_security_group_id = aws_security_group.web.id

  from_port   = 5432
  to_port     = 5432
  ip_protocol = "tcp"

  description = "Allow PostgreSQL from Web SG"
}

resource "aws_vpc_security_group_egress_rule" "rds_all" {
  security_group_id = aws_security_group.rds.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"

  description = "Allow all outbound traffic"
}