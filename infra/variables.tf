variable "name" {
  type    = string
  default = "fargate-demo"
}

variable "region" {
  type    = string
  default = "us-west-2"
}

variable "account_id" {
  type = string
}

variable "repo_name" {
  type    = string
  default = "fargate-demo-app"
}

variable "image_tag" {
  type    = string
  default = "1.0.0"
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "task_cpu" {
  type    = number
  default = 256
}

variable "task_memory" {
  type    = number
  default = 512
}

variable "private_subnet_ids" {
  type    = list(string)
  default = []
}

variable "min_capacity" {
  type    = number
  default = 1
}

variable "max_capacity" {
  type    = number
  default = 3
}

variable "cpu_target" {
  type    = number
  default = 50
}

variable "domain_name" {
  type        = string
  description = "Fully-qualified domain for the app, e.g. app.example.com"
}

# variable "hosted_zone_name" {
#   type        = string
#   description = "Apex domain for the hosted zone, e.g. yourdomain.com"
# }


# variable "hosted_zone_id" {
#   type        = string
#   description = "Route 53 Hosted Zone ID that contains domain_name"
# }

# (Optional) SNS Topic for alarm notifications (email/SMS/etc.)
variable "alarm_sns_topic_arn" {
  type        = string
  default     = ""
  description = "SNS topic ARN to notify from CloudWatch alarms (leave empty to skip actions)"
}

