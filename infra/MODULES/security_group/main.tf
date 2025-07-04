resource "aws_security_group" "this" {
  provider    = aws  # Use the provider defined in the module’s context
  name        = var.security_group_name
  description = "Security group for ${var.security_group_name}"
  vpc_id      = var.vpc_id

  # Inbound rules
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks  = ingress.value.cidr_blocks
    }
  }

  # Outbound rules
  dynamic "egress" {
    for_each = var.egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks  = egress.value.cidr_blocks
    }
  }

  tags = {
    Name = var.security_group_name
  }
}
