data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "2.70"

  name = "vpc-runners"
  cidr = "10.0.0.0/16"

  azs = [
    data.aws_availability_zones.available.names[0]]
  private_subnets = [
    "10.0.1.0/24"]
  public_subnets = [
    "10.0.101.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true
  enable_s3_endpoint = true

  tags = {
    Environment = "Runners"
  }
}

resource "aws_security_group" "runner" {
  name = "runner-sg"
  vpc_id = module.vpc.vpc_id

  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = [
      "0.0.0.0/0"]
  }
}
