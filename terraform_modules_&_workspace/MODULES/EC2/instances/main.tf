############### basic skeleton ############
# variables are defined inside referenced module

resource "aws_instance" "single-instance"{
  ami           = var.instance_ami
  # based on workspace the value shall be passed here
  instance_type = var.instance_type[terraform.workspace]
  # necessary for all instance, so dont variablize it
  monitoring    = true
  subnet_id     = var.subnet_id
  tags = var.tags
}