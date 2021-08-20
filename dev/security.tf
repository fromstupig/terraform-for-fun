resource "aws_security_group" "lb" {
  name = "dev-load-balancer-sg"
  description = "controls access to the ALB in Dev env"
  vpc_id = aws_vpc.main.id

  ingress {
    protocol = "tcp"
    from_port = 443
    to_port = 443
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = [
      "0.0.0.0/0"]
  }
}

resource "aws_security_group" "ecs_tasks" {
  name = "dev-ecs-tasks-sg"
  description = "allow inbound access from the ALB only"
  vpc_id = aws_vpc.main.id

  ingress {
    protocol = "tcp"
    from_port = var.api_port
    to_port = var.api_port
    security_groups = [
      aws_security_group.lb.id]
  }

  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = [
      "0.0.0.0/0"]
  }
}

resource "aws_security_group" "db" {
  name = "dev-rds-sg"
  description = "allow inbound access from the ECS only"
  vpc_id = aws_vpc.main.id
  ingress {
    protocol = "tcp"
    from_port = var.db_port
    to_port = var.db_port
    security_groups = [
      aws_security_group.ecs_tasks.id,
      aws_security_group.bastion.id]
  }
}

resource "aws_security_group" "bastion" {
  name = "dev-bastion-host-sg"
  description = "allow ssh inbound access to bastion host"
  vpc_id = aws_vpc.main.id
  ingress {
    protocol = "tcp"
    from_port = 22
    to_port = 22
    # This sg should only whitelist IP from verify organization
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = [
      "0.0.0.0/0"]
  }
}

resource "aws_security_group" "memcached" {
  name = "dev-memcached-sg"
  description = "allow inbound access to memcached"
  vpc_id = aws_vpc.main.id
  ingress {
    from_port = var.memcached_port
    protocol = "tcp"
    to_port = var.memcached_port
    security_groups = [
      aws_security_group.ecs_tasks.id,
      aws_security_group.bastion.id]
  }
}

resource "aws_security_group" "rabbitmq" {
  name = "dev-rabbitqm-sg"
  description = "allow inbound access to rabbitmq"
  vpc_id = aws_vpc.main.id
  ingress {
    from_port = var.rabbitmq_port
    protocol = "tcp"
    to_port = var.rabbitmq_port
    security_groups = [
      aws_security_group.ecs_tasks.id,
      aws_security_group.bastion.id]
  }
}
