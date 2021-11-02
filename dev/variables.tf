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
  description = "API Docker celery image to run in the ECS cluster"
  default = "663627765046.dkr.ecr.us-east-1.amazonaws.com/vio/api:dev-latest"
}

variable "dbmigration_image" {
  description = "API Docker migration image to run in the ECS cluster"
  default = "663627765046.dkr.ecr.us-east-1.amazonaws.com/vio/migrate:dev-latest"
}

variable "analytics_image" {
  description = "API Docker analytics image to run in the ECS cluster"
  default = "663627765046.dkr.ecr.us-east-1.amazonaws.com/vio/analytics:dev-latest"
}

variable "api_port" {
  description = "Port exposed by the api Docker image to redirect traffic to"
  default = "8000"
}

variable "analytics_port" {
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

variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU unists)"
  default = "2048"
}

variable "fargate_memory" {
  description = "Fargate instance memory o provision (in MiB)"
  default = "4096"
}

variable "analytics_fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU unists)"
  default = "1024"
}

variable "analytics_fargate_memory" {
  description = "Fargate instance memory o provision (in MiB)"
  default = "2048"
}

variable "dbmigration_fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU unists)"
  default = "1024"
}

variable "dbmigration_fargate_memory" {
  description = "Fargate instance memory o provision (in MiB)"
  default = "2048"
}

variable "dbmigration_min_containers" {
  description = "Minimum number of Celery containers to run"
  default = 1
}

variable "analytics_min_containers" {
  description = "Minimum number of Celery containers to run"
  default = 1
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
  default = "vio-dev-storage"
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

variable "sns_name" {
  description = "SNS main topic name"
  default = "vio-general"
}

variable "account_id" {
  description = "AWS owner account id"
  default = "663627765046"
}

variable "sns_subscription_email_address_list" {
  description = "SNS subscription email address sandbox"
  type = list(string)
  default = ["phong@prismtechinc.io"]
}

variable "sns_subscription_protocol" {
  default = "email"
  description = "SNS subscription protocal"
}

variable "default_sender_id" {
  description = "A custom ID, such as your business brand, displayed as the sender on the receiving device. Support for sender IDs varies by country."
  type        = string
  default     = "vio"
}

variable "default_sms_type" {
  description = "Promotional messages are noncritical, such as marketing messages. Transactional messages are delivered with higher reliability to support customer transactions, such as one-time passcodes."
  type        = string
  default     = "Promotional"
}

variable "delivery_status_iam_role_arn" {
  description = "The IAM role that allows Amazon SNS to write logs for SMS deliveries in CloudWatch Logs."
  type        = string
  default     = ""
}

variable "delivery_status_success_sampling_rate" {
  description = "Default percentage of success to sample."
  type        = number
  default     = 0
}

variable "monthly_spend_limit" {
  description = "The maximum amount to spend on SMS messages each month. If you send a message that exceeds your limit, Amazon SNS stops sending messages within minutes."
  type        = number
  default     = 1
}

variable "policy_name" {
  description = "Name of policy to publish to Group SMS topic."
  type        = string
  default     = "group-sms-publish"
}

variable "policy_path" {
  description = "Path of policy to publish to Group SMS topic"
  type        = string
  default     = "/"
}

variable "role_name" {
  description = "The IAM role that allows Amazon SNS to write logs for SMS deliveries in CloudWatch Logs."
  type        = string
  default     = "SNSSuccessFeedback"
}

variable "phone_subscriptions" {
  description = "List of telephone numbers to subscribe to SNS."
  type        = list(string)
  default     = ["+84346639858"]
}

variable "usage_report_s3_bucket" {
  description = "The Amazon S3 bucket to receive daily SMS usage reports. The bucket policy must grant write access to Amazon SNS."
  type        = string
  default = "vio-dev-sms-usage-report"
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
