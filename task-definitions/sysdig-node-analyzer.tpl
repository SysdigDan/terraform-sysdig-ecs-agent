[
  {
    "name": "sysdig-ecs-node-image-analyzer",
    "image": "quay.io/sysdig/node-image-analyzer:latest",
    "memory": 512,
    "privileged": true,
    "environment": [
      {
        "name": "ACCESS_KEY",
        "value": "${sysdig_access_key}"
      },
      {
        "name": "AM_COLLECTOR_ENDPOINT",
        "value": "https://${sysdig_endpoint}/internal/scanning/scanning-analysis-collector"
      },
      {
        "name": "TAGS",
        "value": "ecs-cluster:${tags}"
      }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "sysdig-ecs-node-image-analyzer",
        "awslogs-create-group": "true",
        "awslogs-region": "${aws_region}",
        "awslogs-stream-prefix": "sysdig-ecs-node-image-analyzer"
      }
    },
    "mountPoints": [
      {
        "containerPath": "/var/run",
        "sourceVolume": "run"
      }
    ]
  },
  {
    "name": "sysdig-ecs-compliance-benchmark",
    "image": "quay.io/sysdig/compliance-benchmark-runner:latest",
    "privileged": true,
    "memory": 256,
    "environment": [
      {
        "name": "ACCESS_KEY",
        "value": "${sysdig_access_key}"
      },
      {
        "name": "BACKEND_ENDPOINT",
        "value": "https://${sysdig_endpoint}"
      },
      {
        "name": "TAGS",
        "value": "ecs-cluster:${tags}"
      }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "sysdig-ecs-compliance-benchmark",
        "awslogs-create-group": "true",
        "awslogs-region": "${aws_region}",
        "awslogs-stream-prefix": "sysdig-ecs-compliance-benchmark"
      }
    },
    "mountPoints": [
      {
        "readOnly": true,
        "containerPath": "/host",
        "sourceVolume": "host"
      },
      {
        "containerPath": "/host/tmp",
        "sourceVolume": "tmp"
      }
    ]
  },
  {
    "name": "sysdig-ecs-host-analyzer",
    "image": "quay.io/sysdig/host-analyzer:latest",
    "privileged": true,
    "memory": 256,
    "environment": [
      {
        "name": "ACCESS_KEY",
        "value": "${sysdig_access_key}"
      },
      {
        "name": "AM_COLLECTOR_ENDPOINT",
        "value": "https://${sysdig_endpoint}/internal/scanning/scanning-analysis-collector"
      },
      {
        "name": "HOST_BASE",
        "value": "/host"
      },
      {
        "name": "SCHEDULE",
        "value": "@dailydefault"
      },
      {
        "name": "TAGS",
        "value": "ecs-cluster:${tags}"
      }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "sysdig-ecs-host-analyzer",
        "awslogs-create-group": "true",
        "awslogs-region": "${aws_region}",
        "awslogs-stream-prefix": "sysdig-ecs-host-analyzer"
      }
    },
    "mountPoints": [
      {
        "readOnly": true,
        "containerPath": "/host",
        "sourceVolume": "host"
      }
    ]
  }
]
