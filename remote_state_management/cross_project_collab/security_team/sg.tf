resource "aws_security_group" "example" {
  name        = "security group"
  description = "example"
  vpc_id      = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "example" {
  security_group_id = aws_security_group.example.id

  cidr_ipv4   = "${data.terraform_remote_state.eip.outputs.eip}/32"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

