data "template_file" "sysdig-agent" {
  template = "${file("task-definitions/sysdig-agent.tpl")}"
  vars = {
    aws_region = "${var.aws_region}"
    sysdig_access_key = "${var.sysdig_access_key}"
    sysdig_collector = "${var.sysdig_collector}"
    sysdig_agent_mode = "${var.sysdig_agent_mode}"
    tags = "${var.tags}"
  }
}

data "template_file" "sysdig-node-analyzer" {
  template = "${file("task-definitions/sysdig-node-analyzer.tpl")}"
  vars = {
    aws_region = "${var.aws_region}"
    sysdig_access_key = "${var.sysdig_access_key}"
    sysdig_endpoint = "${var.sysdig_endpoint}"
    tags = "${var.tags}"
  }
}
