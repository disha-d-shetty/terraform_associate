############ referencing the customised module for team A to use ##########
# variables are passed as arguments here.
module "ec2_customised" {
  source = "../MODULES/EC2/instances"
  instance_ami = "ami-12345678"  
  subnet_id    = "subnet-01"
  tags = {
    Name        = "TeamA-EC2-Instance"
    Environment = "dev"
  }
}

