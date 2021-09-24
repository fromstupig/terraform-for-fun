resource "aws_key_pair" "vio_runner_key" {
  key_name = var.ec2_key_name
  public_key = var.ec2_public_key
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_security_group" "runner" {
  name = "runner-sg"
  vpc_id = module.vpc.vpc_id
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

module "runner" {
  source = "npalm/gitlab-runner/aws"
  aws_region = var.aws_region
  environment = "spot-runners"
  vpc_id = module.vpc.vpc_id
  subnet_ids_gitlab_runner = module.vpc.private_subnets
  subnet_id_runners = element(module.vpc.private_subnets, 0)
  runners_executor = "docker"
  runners_name = "docker-default"
  runners_gitlab_url = "https://gitlab.com"
  metrics_autoscaling = [
    "GroupDesiredCapacity",
    "GroupInServiceCapacity"]
  enable_runner_ssm_access = true
  docker_machine_instance_type = "t3.micro"
  docker_machine_spot_price_bid = "0.0032"
  runners_iam_instance_profile_name = "IAM_Role_Instance_Profile"
  runners_off_peak_timezone = "Asia/Bangkok"
  runners_off_peak_idle_count = 0
  runners_off_peak_idle_time = 60
  runners_privileged = "true"
  runners_additional_volumes = [
    "/certs/client"]
  runners_volumes_tmpfs = [
    {
      volume = "/var/opt/cache",
      options = "rw,noexec"
    }]
  runners_services_volumes_tmpfs = [
    {
      volume = "/var/lib/mysql",
      options = "rw,noexec"
    }]
  # working 9 to 5
//  runners_off_peak_periods = "[\"* * 0-7,22-23 * * mon-fri *\", \"* * * * * sat,sun *\"]"
  # You can create ssh_key_pair in AWS & provide the name here
  ssh_key_pair = "${aws_key_pair.vio_runner_key.key_name}"
  gitlab_runner_security_group_ids = [aws_security_group.runner.id]
  gitlab_runner_registration_config = {
    registration_token = "${var.group_token}"
    tag_list = "[docker]"
    // this tag used in CICD
    description = "group runner"
    locked_to_project = "false"
    run_untagged = "false"
    maximum_timeout = "3600"
  }
}
