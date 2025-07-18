#  ami-05ffe3c48a9991133
data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners     = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-2023.7.*"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}
# subnet-0b6f95f3a5ba36ba9, auto assign of ip is enabled
data "aws_subnet" "selected" {
  filter {
    name   = "tag:Name"
    values = ["Terraform"]
  }
}
data "aws_vpc" "selected" {
  id = var.vpc_id
}