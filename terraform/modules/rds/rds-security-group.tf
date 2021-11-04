resource "aws_security_group" "allow-rds-sg" {

  description = "RDS sg"

  name = "allow-rds-port-sg.${var.application}.${var.environment}"

  vpc_id = var.vpc-id

  ingress {
    description = "Allow HTTP port"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
