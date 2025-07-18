# these variables are called in reference files, to get input from user
variable "instance_id" {
  description = "The ID of the EC2 instance to associate the EIP with"
  type        = string
}