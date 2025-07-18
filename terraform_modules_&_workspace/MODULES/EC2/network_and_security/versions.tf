# not necessary. For more control of provider version, you can use it
// Link - https://developer.hashicorp.com/terraform/language/terraform 
# to see compatibility of terraform version and provider version, you can use this 
// Link - https://registry.terraform.io/providers/hashicorp/aws/latest/docs#requirements
terraform {
  # terraform version
  required_version = "1.12.2"
  # provider version
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">6.0.0"
      # Multiple provider configuration
      configuration_aliases = [ aws.dev2, aws.default ]
    }
  }
}