/* 
 not necessary. For more control of provider version, you can use it
 Link - https://developer.hashicorp.com/terraform/language/terraform 
 to see compatibility of terraform version and provider version, you can use this 
 Link - https://registry.terraform.io/providers/hashicorp/aws/latest/docs#requirements
*/
terraform {
  # terraform version
  required_version = "1.12.2"
  # provider version
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0"
    }
    github = {
      # when source is to be specific(unlike aws), you have to use this terraform block
      source  = "integrations/github"
      # ~> means any version in range 6.x
      version = "~> 6.0"
    }
  }
}

# must!
provider "aws" {
  region     = "us-east-1"
  # use aws cli to get these values from $user/.aws/credentials file (default path for .tf & cli)
  # (no need to write anything here, it ll fetch automatically from ur system)
                          # OR
  # access_key = ""
  # secret_key = "" 
                          # OR
  # use environment variables AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY
                          # OR
  # shared_credentials_file = "/path/to/your/credentials"          
}
