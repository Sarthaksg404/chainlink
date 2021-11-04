resource "aws_security_group" "allow-redis-sg" {

  description = "Redis sg"

  name = "allow-redis-port-sg.${var.application}.${var.environment}"

  vpc_id = var.vpc-id

  ingress {
    description = "Allow HTTP port"
    from_port   = var.redis_port
    to_port     = var.redis_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
