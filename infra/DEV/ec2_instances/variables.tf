variable "ec2_configurations" {
  description = "Map of configurations for EC2 instances."
  
  type = map(object({
    server_name            = string
    region                 = string
    ami                    = string
    instance_type          = string
    instance_count         = number
    availability_zone      = string
    key_name               = string
    subnet_id              = string
    vpc_security_group_ids = list(string)
    user_data              = optional(string)
    root_volume_size       = optional(number, 8)
    root_volume_type       = optional(string, "gp2")
    attach_eip             = optional(bool, false)
    eip_name               = optional(string) # Optional attribute for EIP name

    # Declare additional volumes as a map
    additional_volumes = optional(map(object({
      volume_size           = number
      volume_type           = string
      device_name           = string  # e.g., /dev/sdh
      delete_on_termination = optional(bool, true)
    })), {})
    tags = map(string)

    # Add new fields for KMS key ID and encryption flag
    kms_key_id              = string
    encryption_enabled      = bool
  }))
}