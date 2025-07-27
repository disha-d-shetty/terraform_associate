data "terraform_remote_state" "eip"{
  backend = "s3"
  config = {
    bucket         = "terraform-disha"
    key            = "eip.tfstate"
    use_lockfile = true
    region         = "us-east-1"
  }
}
