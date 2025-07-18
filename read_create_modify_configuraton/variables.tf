############ Create variables and initialise them if needed(default values) ############

# default value can be defined/ the value can be pulled from *.tfvars file
variable "VPC_id" {
  description = "The ID of the VPC where the resources will be created"
  type        = string
}

variable "https_port" {
  description = "The port number for HTTPS traffic"
  # data type restricted, so that random strings/value is given
  type    = number
  default = 443
}

variable "region" {
  description = "The AWS region where the resources will be created"
  type        = string
}
# map data type
variable "tags_for_all" {
  description = "Common tags for all resources"
  type        = map(string)
}

variable "ingress_rules" {
  description = "List of ingress rules for the security group"
  type        = list(any)
}
variable "egress_rules" {
  description = "List of ingress rules for the security group"
  type = list(object({
    from_port = number
    to_port   = number
  }))
}
variable "iam_users" {
  description = "set of IAM users to be created"
  type        = set(string)
}