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
        }, {
            "name": "SECRET_KEY",
            "value": "^%c+#1wu+g(s&_2ybin4_w-r)39i5(%6)0y_d70q2vd4ip9y$%"
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
