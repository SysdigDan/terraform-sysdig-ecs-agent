resource "aws_ecs_task_definition" "sysdig-agent" {
  family = "sysdig-agent"
  container_definitions = data.template_file.sysdig-agent-slim.rendered
  pid_mode = "host"
  network_mode = "host"
  volume {
    name      = "sock"
    host_path = "/var/run/docker.sock"
  }
  volume {
    name      = "dev"
    host_path = "/dev/"
  }
  volume {
    name      = "proc"
    host_path = "/proc/"
  }
  volume {
    name      = "boot"
    host_path = "/boot/"
  }
  volume {
    name      = "modules"
    host_path = "/lib/modules/"
  }
  volume {
    name      = "usr"
    host_path = "/usr/"
  }
  requires_compatibilities = [ "EC2" ]
}

resource "aws_ecs_task_definition" "sysdig-node-analyzer" {
  family = "sysdig-node-analyzer"
  container_definitions = data.template_file.sysdig-node-analyzer.rendered
  pid_mode = "host"
  network_mode = "host"
  volume {
    name      = "run"
    host_path = "/var/run/"
  }
  volume {
    name      = "tmp"
    host_path = "/tmp/"
  }
  volume {
    name      = "host"
    host_path = "/"
  }
  requires_compatibilities = [ "EC2" ]
}

resource "aws_ecs_service" "sysdig-agent" {
  name            = "sysdig-agent"
  cluster         = var.aws_ecs_cluster_id
  task_definition = aws_ecs_task_definition.sysdig-agent.arn
  scheduling_strategy = "DAEMON"
  launch_type     = "EC2"
}

resource "aws_ecs_service" "sysdig-node-analyzer" {
  name            = "sysdig-node-analyzer"
  cluster         = var.aws_ecs_cluster_id
  task_definition = aws_ecs_task_definition.sysdig-node-analyzer.arn
  scheduling_strategy = "DAEMON"
  launch_type     = "EC2"
}
