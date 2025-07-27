# this defines where the state file will be stored
# u can have multiple terraform blocks in a folder(eg - backend.tf & provider.tf)
terraform {
  # backend "local" {
  #   path = "./state_files/dev.tfstate"
  # }
  # configurations changes, check the documentation
  backend "s3" {
    bucket         = "terraform-disha"
    # have directory terraform/statefiles created in the bucket
    # key            = "terraform/statefiles/dev.tfstate"
    key            = "dev.tfstate"
    use_lockfile = true
    region         = "us-east-1"
  }
}