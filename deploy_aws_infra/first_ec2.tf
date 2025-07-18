
resource "aws_instance" "first_ec2" {
# always be specify all the necessary values! 
  # AMI changes with OS and with regions!
  ami           = "ami-05ffe3c48a9991133" 
  instance_type = "t2.micro"
  # if there is no default VPC created from AWS, then even if ur VPC is tenancy is default, it wont detect.
  # so, subnet has to be specified.
  subnet_id = "subnet-0b6f95f3a5ba36ba9" 

  tags = {
    Name = "Terraform"
  }
}