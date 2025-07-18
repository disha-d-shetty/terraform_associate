# these variables are called in reference files, to get input from user
variable "instance_ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}
# based on workspace selected the value shall be passed
variable "instance_type" {
  description = "Type of the EC2 instance"
  type        = map
  default     = {
    default = "t2.micro"
    dev2    = "t2.large"
    dev = "t3.micro"
  }
}
variable "subnet_id" {
  #"subnet-0b6f95f3a5ba36ba9"
  description = "Subnet ID for the EC2 instance"
  type        = string
}
variable "tags" {
  description = "Tags to apply to the EC2 instance"
  type        = map(string)
}