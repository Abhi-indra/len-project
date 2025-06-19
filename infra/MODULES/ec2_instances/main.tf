resource "aws_instance" "this" {
  count                  = var.instance_count
  ami                    = var.ami
  instance_type          = var.instance_type
  availability_zone      = var.availability_zone
  key_name               = var.key_name
  subnet_id              = var.subnet_id

  vpc_security_group_ids = var.vpc_security_group_ids  

  tags = merge(
    var.tags,
    {
      Instance_name = "${var.server_name}"
    }
  )

  iam_instance_profile = var.iam_instance_profile_id
  user_data            = var.user_data

  # EBS Block Storage (Root Volume)
  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = var.root_volume_type
    delete_on_termination = true
    encrypted             = var.encryption_enabled  # Use variable for encryption
    kms_key_id            = var.kms_key_id          # Use variable for KMS key
  }

  # Add additional volumes using for_each
  dynamic "ebs_block_device" {
    for_each = var.additional_volumes
    content {
      volume_size           = ebs_block_device.value.volume_size
      volume_type           = ebs_block_device.value.volume_type
      device_name           = ebs_block_device.value.device_name
      delete_on_termination = lookup(ebs_block_device.value, "delete_on_termination", true)
      encrypted             = var.encryption_enabled  # Use variable for encryption
      kms_key_id            = var.kms_key_id          # Use variable for KMS key
    }
  }
}

# Create Elastic IP if `attach_eip` is true
resource "aws_eip" "this" {
  count = var.attach_eip ? 1 : 0

  tags = {
    Name = var.eip_name
  }
}

# Associate the Elastic IP with the EC2 instance if `attach_eip` is true
resource "aws_eip_association" "this" {
  count        = var.attach_eip ? 1 : 0
  instance_id  = aws_instance.this[count.index].id
  allocation_id = aws_eip.this[0].id  # Only one EIP is created, hence index [0]
}