# Multiple provider configuration
# alias provider for TeamA
module "customised_eip" {
  source = "../MODULES/EC2/network_and_security"
  # the variable names are passed as key.
  # the output value of ec2.tf is passed here as value.
  # module.module_name.output_name
  instance_id = module.ec2_customised.instance_id
  providers = {
    aws.default = aws
    aws.dev2  = aws.ohio
  }
}
