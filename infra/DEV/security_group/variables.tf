# variable "vpc_id" {
#   description = "The ID of the VPC where the security groups will be created"
#   type        = string
# }

variable "vpc_name" {
  description = "The name of the VPC to find"
  type        = string
}

variable "security_group_configurations" {
  description = "List of security group configurations"
  type = list(object({
    security_group_name = string
    ingress_rules = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
    egress_rules = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
  }))
}
