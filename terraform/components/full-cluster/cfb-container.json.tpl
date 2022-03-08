[
  {
    "name": "${ecs_service_name}",
    "image": "${docker_image_url}",
    "cpu": ${fargate_cpu},
    "memory": ${fargate_memory},
    "essential": true,
    "portMappings": [
      {
        "containerPort": ${docker_container_port},
        "hostPort": 0
      }
    ],
    "logConfiguration": 
      {
        "logDriver": "awslogs",
          "options": 
            {
              "awslogs-group": "${ecs_service_name}-LogGroup",
              "awslogs-region": "${aws_region}",
              "awslogs-stream-prefix": "${ecs_service_name}-LogGroup-stream"
            }
      },
    "environment": [
      { "name" : "VUE_APP_BASE_API_URL", "value" : "${vue_app_base_api_url}" },
      { "name" : "NODE_ENV", "value" : "${node_env}" },
      { "name" : "DATABASE_HOST", "value" : "${database_host}" },
      { "name" : "DATABASE_USERNAME", "value" : "${database_user}" },
      { "name" : "DATABASE_PORT", "value" : "${database_port}" },
      { "name" : "DATABASE_NAME", "value" : "${database_name}" },
      { "name" : "JWT_KEY", "value" : "${jwt_key}" },
      { "name" : "SMTP_HOST", "value" : "${smtp_host}" },
      { "name" : "SMTP_PORT", "value" : "${smtp_port}" },
      { "name" : "SMTP_USER", "value" : "${smtp_user}" },
      { "name" : "SMTP_PASSWORD", "value" : "${smtp_password}" },
      { "name" : "DATABASE_PASSWORD", "value" : "${database_password}" }
    ]
  }
]
