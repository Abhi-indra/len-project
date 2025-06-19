variable "vpc_name" {
  type        = string
  default     = "toorey-uat"
  description = "The name of the VPC for the UAT environment"
}

variable "cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "The CIDR block for the VPC"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  default     = ["10.0.6.0/24", "10.0.8.0/24"]
  description = "CIDR blocks for private subnets"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
  description = "CIDR blocks for public subnets"
}

variable "azs" {
  type        = list(string)
  default     = ["us-east-1a","us-east-1b","us-east-1c"]
  description = "List of availability zones"
}
