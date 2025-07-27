############ Understand the Terraform Import Usage ############
# provider is necessary, but its been added in provider.tf
import {
  to = aws_security_group.example
  id = "sg-0d77fb2d12dd3f3ef"
}