ec2_configurations = {
  lensbation = {
    server_name            = "lensbation"
    region                 = "us-east-1"
    ami                    = "ami-005fc0f236362e99f"
    instance_type          = "t2.micro"
    instance_count         = 1
    availability_zone      = "us-east-1a"
    key_name               = "lens"
    vpc_security_group_ids = ["sg-0629588526b6bc2da"]
    subnet_id              = "subnet-0c5cc81be849a3004"
    user_data              = null
    root_volume_size       = 8
    root_volume_type       = "gp3"
    attach_eip             = true
    eip_name               = "lensbation-eip"
    
    additional_volumes = {}

    tags = {
      Name = "lensbation",
    }

    # New parameters for KMS key and encryption
    kms_key_id              = "arn:aws:kms:us-east-1:314591218962:key/9b8aca9c-cbe8-43c3-9c48-201529d63f4f"  # Replace with your KMS key ARN
    encryption_enabled      = true  # Set this variable to enable encryption
  },
    lensbackend = {
    server_name            = "lensbackend"
    region                 = "us-east-1"
    ami                    = "ami-005fc0f236362e99f"
    instance_type          = "t2.micro"
    instance_count         = 1
    availability_zone      = "us-east-1a"
    key_name               = "lens"
    vpc_security_group_ids = ["sg-017fb0872cbc97168"]
    subnet_id              = "subnet-02f4606fb084ff2bc"
    user_data              = null
    root_volume_size       = 8
    root_volume_type       = "gp3"
    attach_eip             = false
    eip_name               = ""
    
    additional_volumes = {}

    tags = {
      Name = "lensbation",
    }

    # New parameters for KMS key and encryption
    kms_key_id              = "arn:aws:kms:us-east-1:314591218962:key/9b8aca9c-cbe8-43c3-9c48-201529d63f4f"  # Replace with your KMS key ARN
    encryption_enabled      = true  # Set this variable to enable encryption
  },
}