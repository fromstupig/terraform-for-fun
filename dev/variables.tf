variable "aws_region" {
  description = "The AWS region things are created in"
  default = "us-east-1"
}

variable "ecs_task_execution_role_name" {
  description = "ECS task execution role name"
  default = "vioECSTaskExecutionRole"
}

variable "ecs_services_access_role_name" {
  description = "ECS services access role name"
  default = "vioECSServicesAccessRole"
}

variable "ecs_auto_scale_role_name" {
  description = "ECS auto scale role name"
  default = "vioECSAutoScaleRole"
}

variable "az_count" {
  description = "Number of AZs to cover in given region"
  default = "2"
}

variable "api_image" {
  description = "API Docker image to run in the ECS cluster"
  default = "663627765046.dkr.ecr.us-east-1.amazonaws.com/vio/api:dev-latest"
}

variable "celery_image" {
  description = "API Docker image to run in the ECS cluster"
  default = "663627765046.dkr.ecr.us-east-1.amazonaws.com/vio/api:dev-latest"
}

variable "api_port" {
  description = "Port exposed by the api Docker image to redirect traffic to"
  default = "8000"
}

variable "api_min_containers" {
  description = "Minimum number of API containers to run"
  default = 1
}

variable "celery_min_containers" {
  description = "Minimum number of Celery containers to run"
  default = 1
}

variable "api_max_containers" {
  description = "Maximum number of API containers to run"
  default = 3
}

variable "celery_max_containers" {
  description = "Maximum number of Celery containers to run"
  default = 3
}

variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU unists)"
  default = "2048"
}

variable "fargate_memory" {
  description = "Fargate instance memory o provision (in MiB)"
  default = "4096"
}

variable "celery_fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU unists)"
  default = "2048"
}

variable "celery_fargate_memory" {
  description = "Fargate instance memory o provision (in MiB)"
  default = "4096"
}

variable "domain" {
  description = "Domain host"
  default = "prismtechinc.com"
}

variable "web_domain" {
  description = "Domain host of web"
  default = "dev.prismtechinc.com"
}

variable "db_port" {
  description = "Port exposed by RDS database"
  default = "5432"
}

variable memcached_port {
  description = "Port exposed by Memcached"
  default = "11211"
}

variable num_cache_nodes {
  description = "Number cache nodes"
  default = 1
}

variable "db_identifier" {
  description = "DB indentifier"
  default = "vio-db-dev"
}

variable "db_name" {
  description = "DB name"
  default = "vio"
}

variable "env_name" {
  description = "Environment name"
  default = "Development"
}

variable "s3_env_bucket" {
  description = "S3 bucket where located env file"
  default = "vio-env"
}

variable "health_check_path" {
  default = "/"
}

variable "ec2_key_name" {
  description = "AWS EC2 key pair name which is used for ssh access"
  default = "vio-development-ssh"
}

variable "enable_bastion" {
  description = "Enable bastion flag"
  default = false
}

variable "s3_storage" {
  description = "S3 storage for media, file .etc"
  default = "vio-storage"
}

variable "infra_state_storage" {
  description = "S3 storage for Terraform state"
  default = "vio-ops"
}

variable "rabbitmq_user" {
  description = "RabbitMQ user"
  default = "admin"
}

variable "rabbitmq_password" {
  description = "RabbitMQ password"
  default = "you-can-guess-but-it-not-true"
}

variable "rabbitmq_port" {
  description = "RabbitMQ port"
  default = "5671"
}

# Sensitive variable 
variable "ec2_public_key" {
  description = "AWS EC2 public key which is used for ssh access"
  default = "You-never-know"
}

variable "db_password" {
  description = "Main db password"
  default = "You-never-know"
}

variable "db_user" {
  description = "Main db user"
  default = "default-user"
}
# End of sensitive vairable 
