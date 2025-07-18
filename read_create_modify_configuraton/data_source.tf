
############ Usage of data source to read existing resources ############

# data "aws_instance" "foo" {
#     region = var.region
#   instance_id = "i-0c12ff895af7d0e2c"
# }
# output "instance_ip" {
#   value = data.aws_instance.foo.public_ip
# }
# output "instance_ami" {
#   value = data.aws_instance.foo.ami
# }

#############  AMI for a particular region #############

data "aws_ami" "example" {
  region      = var.region
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-mantic-23.10-amd64-server-*"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "aws_vpc" "existing" {
  id = var.VPC_id
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.example.id
  instance_type = "t2.micro"
  tags          = var.tags_for_all
}

