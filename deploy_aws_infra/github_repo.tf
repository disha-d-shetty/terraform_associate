# you cannot have multiple terraform blocks in a single folder, so had to combine in provider file

# Configure the GitHub Provider
provider "github" {
   token = ""
}

# resource "github_repository" "example" {
#   name        = "example"
#   description = "My awesome codebase"

#   visibility = "public"

# }