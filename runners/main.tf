resource "aws_key_pair" "vio_runner_key" {
  key_name = var.ec2_key_name
  public_key = var.ec2_public_key
}

module "cache" {
  source = "npalm/gitlab-runner/aws//modules/cache"
  environment = "cache"
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
  # https://aws.amazon.com/ec2/spot/pricing/
  instance_type = "t3.medium"
  docker_machine_instance_type = "t3.medium"
  docker_machine_spot_price_bid = "0.02"
  runners_machine_autoscaling = [
    {
      idle_count = 0
      idle_time = 60
      # working 7 to 1
      periods = [
        "* * 2-7 * * mon-sat *"]
      timezone = "Asia/Bangkok"
    }]
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
  ssh_key_pair = aws_key_pair.vio_runner_key.key_name
  gitlab_runner_security_group_ids = [
    aws_security_group.runner.id]
  gitlab_runner_registration_config = {
    registration_token = var.group_token
    tag_list = "[docker]"
    description = "group runner"
    locked_to_project = "false"
    run_untagged = "true"
    maximum_timeout = "3600"
  }

  cache_bucket = {
    create = false
    policy = module.cache.policy_arn
    bucket = module.cache.bucket
  }
}
