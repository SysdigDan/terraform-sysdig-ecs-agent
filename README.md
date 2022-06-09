# Sysdig Agent for AWS ECS

Terraform module that deploys the Sysdig Agent for AWS ECS.
<br/>

## Example Varibles

```terraform
aws_region = "us-east-1"
aws_ecs_cluster_id = "sfc"
sysdig_access_key = "12345678-9123-4567-8912-345678912345"
sysdig_collector = "ingest.au1.sysdig.com"
sysdig_endpoint = "app.au1.sysdig.com"
sysdig_agent_mode = "troubleshooting"

```
