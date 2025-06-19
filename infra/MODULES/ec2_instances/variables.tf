variable "iam_instance_profile_id" {
  description = "The IAM instance profile to associate with the instance"
  type        = string
}

variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
}

variable "ami" {
  description = "The AMI to use for the instance"
  type        = string
}

variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "The type of instance to create"
  type        = string
}

variable "availability_zone" {
  description = "The availability zone to launch the instance in"
  type        = string
}

variable "key_name" {
  description = "The key name of the key pair to use for the instance"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to launch the instance in"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs to associate with the instance"
  type        = list(string)
}

variable "root_volume_size" {
  description = "The size (in GB) of the root EBS volume"
  type        = number
  default     = 8
}

variable "root_volume_type" {
  description = "The type of the root EBS volume"
  type        = string
  default     = "gp3"
}

variable "user_data" {
  description = "The user data script to configure the instance at launch (optional)"
  type        = string
  default     = null
}

variable "server_name" {
  description = "Name for the EC2 instance"
  type        = string
}

variable "attach_eip" {
  description = "Flag to determine if an Elastic IP should be attached"
  type        = bool
}

variable "eip_name" {
  description = "Name for the Elastic IP"
  type        = string
  default     = null # Default to null if not provided
}

variable "additional_volumes" {
  description = "Map of additional volumes to attach to the EC2 instance"
  type = map(object({
    volume_size           = number
    volume_type           = string
    device_name           = string  # e.g., /dev/sdh
    delete_on_termination = optional(bool, true)
  }))
  default = {}
}

variable "tags" {
  description = "Map of tags to apply to the instance and associated resources"
  type        = map(string)
  default     = {}
}

# KMS key ID for volume encryption
variable "kms_key_id" {
  description = "The KMS key ID to use for EBS encryption"
  type        = string
}

# Flag to enable encryption for EBS volumes
variable "encryption_enabled" {
  description = "Flag to enable encryption for EBS volumes"
  type        = bool
  default     = true  # Default to true for encryption
}
 