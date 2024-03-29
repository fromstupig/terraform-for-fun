resource "aws_ecs_cluster" "main" {
  name = "vio-cluster"
}

data "template_file" "api" {
  template = file("./templates/ecs/app.json.tpl")

  vars = {
    app_name = "vio-api"
    app_image = var.api_image
    app_port = var.api_port
    fargate_cpu = var.fargate_cpu
    fargate_memory = var.fargate_memory
    aws_region = var.aws_region
  }
}

resource "aws_ecs_task_definition" "api" {
  family = "vio-api-task"
  task_role_arn = aws_iam_role.ecs_services_access_role.arn
  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn
  network_mode = "awsvpc"
  requires_compatibilities = [
    "FARGATE"]
  cpu = var.fargate_cpu
  memory = var.fargate_memory
  container_definitions = data.template_file.api.rendered
}

resource "aws_ecs_service" "api" {
  name = "vio-api-service"
  cluster = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.api.arn
  desired_count = var.api_min_containers
  launch_type = "FARGATE"
  platform_version = "1.3.0"

  network_configuration {
    security_groups = [
      aws_security_group.ecs_tasks.id]
    subnets = aws_subnet.private.*.id
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.api.id
    container_name = "vio-api"
    container_port = var.api_port
  }

  depends_on = [
    aws_alb_listener.api,
    aws_iam_role_policy_attachment.ecs_task_execution_role,
    module.db]
}

data "template_file" "celery" {
  template = file("./templates/ecs/celery.json.tpl")

  vars = {
    app_name = "vio-celery"
    app_image = var.celery_image
    fargate_cpu = var.celery_fargate_cpu
    fargate_memory = var.celery_fargate_memory
    aws_region = var.aws_region
  }
}

resource "aws_ecs_task_definition" "celery" {
  family = "vio-celery-task"
  task_role_arn = aws_iam_role.ecs_services_access_role.arn
  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn
  network_mode = "awsvpc"
  requires_compatibilities = [
    "FARGATE"]
  cpu = var.celery_fargate_cpu
  memory = var.celery_fargate_memory
  container_definitions = data.template_file.celery.rendered
}

resource "aws_ecs_service" "celery" {
  name = "vio-celery-service"
  cluster = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.celery.arn
  desired_count = var.celery_min_containers
  launch_type = "FARGATE"
  platform_version = "1.3.0"

  network_configuration {
    security_groups = [
      aws_security_group.ecs_tasks.id]
    subnets = aws_subnet.private.*.id
  }

  depends_on = [
    aws_alb_listener.api,
    aws_iam_role_policy_attachment.ecs_task_execution_role,
    module.db]
}

data "template_file" "migration" {
  template = file("./templates/ecs/migration.json.tpl")

  vars = {
    app_name = "vio-migration"
    app_image = var.dbmigration_image
    fargate_cpu = var.dbmigration_fargate_cpu
    fargate_memory = var.dbmigration_fargate_memory
    aws_region = var.aws_region
  }
}

resource "aws_ecs_task_definition" "migration" {
  family = "vio-dbmigration-task"
  task_role_arn = aws_iam_role.ecs_services_access_role.arn
  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn
  network_mode = "awsvpc"
  requires_compatibilities = [
    "FARGATE"]
  cpu = var.dbmigration_fargate_cpu
  memory = var.dbmigration_fargate_memory
  container_definitions = data.template_file.migration.rendered
}

#resource "aws_ecs_service" "migration" {
#  name = "vio-dbmigration-service"
#  cluster = aws_ecs_cluster.main.id
#  task_definition = aws_ecs_task_definition.migration.arn
#  desired_count = var.dbmigration_min_containers
#  launch_type = "FARGATE"
#  platform_version = "1.3.0"
#
#  network_configuration {
#    security_groups = [
#      aws_security_group.ecs_tasks.id]
#    subnets = aws_subnet.private.*.id
#  }
#
#  depends_on = [
#    aws_alb_listener.api,
#    aws_iam_role_policy_attachment.ecs_task_execution_role,
#    module.db]
#}

#data "template_file" "analytics" {
#  template = file("./templates/ecs/analytics.json.tpl")
#
#  vars = {
#    app_name = "vio-analytics"
#    app_image = var.analytics_image
#    app_port = var.analytics_port
#    fargate_cpu = var.analytics_fargate_cpu
#    fargate_memory = var.analytics_fargate_memory
#    aws_region = var.aws_region
#  }
#}
#
#resource "aws_ecs_task_definition" "analytics" {
#  family = "vio-analytics-task"
#  task_role_arn = aws_iam_role.ecs_services_access_role.arn
#  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn
#  network_mode = "awsvpc"
#  requires_compatibilities = [
#    "FARGATE"]
#  cpu = var.analytics_fargate_cpu
#  memory = var.analytics_fargate_memory
#  container_definitions = data.template_file.analytics.rendered
#}
#
#resource "aws_ecs_service" "analytics" {
#  name = "vio-analytics-service"
#  cluster = aws_ecs_cluster.main.id
#  task_definition = aws_ecs_task_definition.analytics.arn
#  desired_count = var.analytics_min_containers
#  launch_type = "FARGATE"
#  platform_version = "1.3.0"
#
#  network_configuration {
#    security_groups = [
#      aws_security_group.ecs_tasks.id]
#    subnets = aws_subnet.private.*.id
#  }
#
#  depends_on = [
#    aws_alb_listener.api,
#    aws_iam_role_policy_attachment.ecs_task_execution_role,
#    module.db]
#}
#
#
#data "template_file" "ofa" {
#  template = file("./templates/ecs/ofa.json.tpl")
#
#  vars = {
#    app_name = "vio-ofa"
#    app_image = var.ofa_image
#    app_port = var.ofa_port
#    fargate_cpu = var.ofa_fargate_cpu
#    fargate_memory = var.ofa_fargate_memory
#    aws_region = var.aws_region
#  }
#}
#
#resource "aws_ecs_task_definition" "ofa" {
#  family = "vio-ofa-task"
#  task_role_arn = aws_iam_role.ecs_services_access_role.arn
#  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn
#  network_mode = "awsvpc"
#  requires_compatibilities = [
#    "FARGATE"]
#  cpu = var.ofa_fargate_cpu
#  memory = var.ofa_fargate_memory
#  container_definitions = data.template_file.ofa.rendered
#}
#
#resource "aws_ecs_service" "ofa" {
#  name = "vio-ofa-service"
#  cluster = aws_ecs_cluster.main.id
#  task_definition = aws_ecs_task_definition.ofa.arn
#  desired_count = var.ofa_min_containers
#  launch_type = "FARGATE"
#  platform_version = "1.3.0"
#
#  network_configuration {
#    security_groups = [
#      aws_security_group.ecs_tasks.id]
#    subnets = aws_subnet.private.*.id
#  }
#
#  depends_on = [
#    aws_alb_listener.api,
#    aws_iam_role_policy_attachment.ecs_task_execution_role,
#    module.db]
#}
