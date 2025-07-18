# for each team, you should have provider and secrets, so


# must!
provider "aws" {
  region = "us-east-1"
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

# Multiple provider configuration
# alias provider for TeamA
provider "aws" {
  alias  = "ohio"
  region = "us-east-2"
}