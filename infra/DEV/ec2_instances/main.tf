# IAM Role for SSM
resource "aws_iam_role" "ssm_role" {
  name = "SSMInstanceRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Effect = "Allow"
        Sid    = ""
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ssm_policy_attachment" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "ssm_profile" {
  name = "SSMInstanceProfile"
  role = aws_iam_role.ssm_role.name
}

# EC2 Instances Module
module "ec2_instances" {
  for_each = var.ec2_configurations
  source   = "../../MODULES/ec2_instances"

  server_name             = each.value.server_name
  region                  = each.value.region
  ami                     = each.value.ami
  instance_type           = each.value.instance_type
  instance_count          = each.value.instance_count
  availability_zone       = each.value.availability_zone
  key_name                = each.value.key_name
  subnet_id               = each.value.subnet_id
  vpc_security_group_ids  = each.value.vpc_security_group_ids
  iam_instance_profile_id = aws_iam_instance_profile.ssm_profile.id
  user_data               = each.value.user_data
  root_volume_size        = each.value.root_volume_size
  root_volume_type        = each.value.root_volume_type
  attach_eip              = each.value.attach_eip
  eip_name                = each.value.eip_name

  # Directly define additional volumes in each instance
  additional_volumes      = each.value.additional_volumes
  tags                    = each.value.tags
  
  # Pass the KMS key ID and encryption flag for each instance
  kms_key_id              = each.value.kms_key_id
  encryption_enabled      = each.value.encryption_enabled
}