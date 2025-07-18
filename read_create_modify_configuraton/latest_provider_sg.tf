################## Dynamic block usage ####################

resource "aws_default_security_group" "default" {
  vpc_id = var.VPC_id

  # ingress {
  #   protocol  = "tcp"
  #   self      = true
  #   from_port = 80
  #   to_port   = 80
  # }
  # ingress {
  #   protocol  = "tcp"
  #   self      = true
  #   from_port = 90
  #   to_port   = 90
  # }
  # egress {
  #   from_port   = 0
  #   to_port     = 0
  #   protocol    = "-1"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  # instead of repeative rules with small change like above, use Dynamic block
  dynamic "ingress" {
    for_each = var.ingress_rules
    iterator = ingress_rule
    content {
      protocol = "tcp"
      self     = true
      # if iterator defined, then use iterator.value
      from_port   = ingress_rule.value
      to_port     = ingress_rule.value
      cidr_blocks = [data.aws_vpc.existing.cidr_block]
    }
  }
  dynamic "egress" {
    for_each = var.egress_rules
    content {
      # if iterator not defined, then use current_block_name.value
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      self        = true
    }
  }
}