############# Usage public module ##################
# to plan/apply this, u need provider.tf file in root directory/same directory
module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.0.2"
}