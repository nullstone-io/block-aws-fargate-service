resource "aws_ecs_task_definition" "this" {
  family                   = "${var.nullstone.stack}-${var.nullstone.env}-${var.nullstone.block}"
  cpu                      = var.service_cpu
  memory                   = var.service_memory
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = data.aws_iam_role.execution.arn

  tags = {
    Stack       = var.nullstone.stack
    Environment = var.nullstone.env
    Block       = var.nullstone.block
  }

  container_definitions = <<EOF
[
  {
    "name": "${var.nullstone.block}",
    "image": "${aws_ecr_repository.this.repository_url}",
    "command": [],
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80,
        "protocol": "tcp"
      }
    ],
    "secrets": [],
    "environment": [],
    "essential": true,
    "cpu": ${var.service_cpu},
    "memoryReservation": ${var.service_memory},
    "mountPoints": [],
    "volumesFrom": [],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-region": "${data.aws_region.this.name}",
        "awslogs-group": "${aws_cloudwatch_log_group.this.name}",
        "awslogs-stream-prefix": "${var.nullstone.env}"
      }
    }
  }
]
EOF
}
