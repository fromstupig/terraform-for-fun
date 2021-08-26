[
  {
      "name": "${app_name}",
      "image": "${app_image}",
      "cpu": ${fargate_cpu},
      "memory": ${fargate_memory},
      "networkMode": "awsvpc",
      "environment": [{
            "name": "POSTGRES_DB",
            "value": "vio"
        }, {
            "name": "POSTGRES_HOST",
            "value": "vio-db-dev.cwo3vdrnog4b.us-east-1.rds.amazonaws.com"
        },{
            "name": "POSTGRES_PASSWORD",
            "value": "3AAqBH2whM6TjAFr"
        },{
            "name": "POSTGRES_USER",
            "value": "postgres"
        }, {
            "name": "ENV",
            "value": "PRODUCTION"
        }],
      "logConfiguration": {
            "logDriver": "awslogs",
            "options": {
                    "awslogs-group": "/ecs/${app_name}",
                    "awslogs-region": "${aws_region}",
                    "awslogs-stream-prefix": "ecs"
                  }
          }
    }
]
