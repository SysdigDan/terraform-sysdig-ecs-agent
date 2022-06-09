[
  {
    "name": "sysdig-ecs-agent",
    "image": "sysdig/agent",
    "memory": 512,
    "privileged": true,
    "environment": [
      {
        "name": "ACCESS_KEY",
        "value": "${sysdig_access_key}"
      },
      {
        "name": "COLLECTOR",
        "value": "${sysdig_collector}"
      },
      {
        "name": "ADDITIONAL_CONF",
        "value": "feature:\n mode: ${sysdig_agent_mode}"
      },
      {
        "name": "TAGS",
        "value": "ecs-cluster:${tags}"
      }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "sysdig-ecs-agent",
        "awslogs-create-group": "true",
        "awslogs-region": "${aws_region}",
        "awslogs-stream-prefix": "sysdig-ecs-agent"
      }
    },
    "mountPoints": [
      {
        "readOnly": true,
        "containerPath": "/host/boot",
        "sourceVolume": "boot"
      },
      {
        "containerPath": "/host/dev",
        "sourceVolume": "dev"
      },
      {
        "readOnly": true,
        "containerPath": "/host/lib/modules",
        "sourceVolume": "modules"
      },
      {
        "readOnly": true,
        "containerPath": "/host/proc",
        "sourceVolume": "proc"
      },
      {
        "containerPath": "/host/var/run/docker.sock",
        "sourceVolume": "sock"
      },
      {
        "readOnly": true,
        "containerPath": "/host/usr",
        "sourceVolume": "usr"
      }
    ]
  }
]


