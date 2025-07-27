terraform {
  backend "s3" {
    bucket         = "terraform-disha"
    key            = "sg.tfstate"
    use_lockfile = true
    region         = "us-east-1"
  }
}