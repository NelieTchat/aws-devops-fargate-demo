# Core
name       = "fargate-demo"
region     = "us-west-2"
account_id = "767397897837"
repo_name  = "fargate-demo-app"
image_tag  = "1.0.0"

# Networking
vpc_id             = "vpc-046a408b4b8beef47"
public_subnet_ids  = ["subnet-0f75bc9f525a4ef4f", "subnet-048779c7b4fcd79ea"]
private_subnet_ids = ["subnet-priv-a", "subnet-priv-b"] # <-- fill with your real private subnets

# Domain
# hosted_zone_name = "Z10339036LNZ66MQBVG2"
#domain_name    = "camnetcloud.com"

# Service sizing
task_cpu    = 256
task_memory = 512

# Autoscaling
min_capacity = 1
max_capacity = 3
cpu_target   = 50

# Monitoring (optional SNS)
# alarm_sns_topic_arn = ""  # e.g. "arn:aws:sns:us-west-2:123456789012:alerts"
