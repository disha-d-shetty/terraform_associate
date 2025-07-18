########### Understand usage of .tfvars file ############

# the variable is been created in variable.tf file
VPC_id = "vpc-00174d304a3c431b7"
region = "us-west-1"
tags_for_all = {
  Name        = "Terraform"
  Environment = "production"
  Owner       = "DevOps Team"
  Project     = "Terraform"
}
https_port    = 443
ingress_rules = [80, 90]
egress_rules = [
  { from_port = 8000, to_port = 8002 },
  { from_port = 9000, to_port = 9002 }
]
iam_users = ["user0", "user1", "user2", "user3"]