resource "aws_security_group" "nginx_rule" {
  name        = "nginx_rule"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    Name = "Terraform"
  }
}
resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.nginx_rule.id
  # for testing purpose, have added my public IP address
  cidr_ipv4         = "24.239.131.31/32"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}
resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.nginx_rule.id
  cidr_ipv4         = "24.239.131.31/32" 
  from_port         = 22
  # protocal can be tcp, udp, icmp, icmpv6, or -1 (for all protocols))only 
  ip_protocol       = "tcp"
  to_port           = 22
}
# have IGW attached to the subnet, so that the instance can access the internet
# if this is not defined, then it ll deny all outbound traffic by default
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.nginx_rule.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}