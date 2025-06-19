vpc_name = "lens-vpc"

# Security groups configurations for multiple regions
security_group_configurations = [
  {
    security_group_name = "lensbastion-sg"
    ingress_rules = [{
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      }
    ]
    egress_rules = [{
      from_port   = 0
      to_port     = 0
      protocol    = "-1" # Allow all egress
      cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  },
    {
    security_group_name = "lensbackend-sg"
    ingress_rules = [{
      from_port   = 5000
      to_port     = 5000
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/16"]
      },
      {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/16"]
      },
    ]
    egress_rules = [{
      from_port   = 0
      to_port     = 0
      protocol    = "-1" # Allow all egress
      cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }
]
