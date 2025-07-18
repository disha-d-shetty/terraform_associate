resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  #variablised this VPC id value
  vpc_id = var.VPC_id
  tags   = var.tags_for_all
}

############# Understand count.index usage #############

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  # string interpolation syntax: ${}
  cidr_ipv4 = "${aws_eip.public_ip[0].public_ip}/32"
  # allows port range (Eg: 80-100) then from_port range(80) and to_port range(100)
  # Port range can be just 80 also. Not always range
  from_port   = var.https_port
  ip_protocol = "tcp"
  to_port     = var.https_port
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports (allow all ports)
  depends_on        = [aws_security_group.allow_tls]
}

