terraform {
  backend "s3" {
    bucket         = "terraform-disha"
    key            = "eip.tfstate"
    use_lockfile = true
    region         = "us-east-1"
  }
}