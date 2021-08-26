resource "aws_cloudwatch_log_group" "api_log_group" {
  name = "/ecs/vio-api"
  retention_in_days = 30

  tags = {
    Name = "api-log-group"
    Environment = var.env_name
  }
}

resource "aws_cloudwatch_log_stream" "api_log_stream" {
  name = "api-log-stream"
  log_group_name = aws_cloudwatch_log_group.api_log_group.name
}

resource "aws_cloudwatch_log_group" "celery_log_group" {
  name = "/ecs/vio-celery"
  retention_in_days = 30

  tags = {
    Name = "celery-log-group"
    Environment = var.env_name
  }
}

resource "aws_cloudwatch_log_stream" "celery_log_stream" {
  name = "celery-log-stream"
  log_group_name = aws_cloudwatch_log_group.celery_log_group.name
}

resource "aws_cloudwatch_log_group" "dbmigration_log_group" {
  name = "/ecs/vio-migration"
  retention_in_days = 30

  tags = {
    Name = "dbmigration-log-group"
    Environment = var.env_name
  }
}

resource "aws_cloudwatch_log_stream" "dbmigration_log_stream" {
  name = "dbmigration-log-stream"
  log_group_name = aws_cloudwatch_log_group.dbmigration_log_group.name
}
