variable "db_password" {
  description = "password for the resource"
  type        = string
  sensitive   = true
  default     = "foobarbaz"
}
resource "local_file" "db_password" {
  content  = var.db_password
  filename = "${path.module}/db_password.txt"
#   sensitive_content = true #XXX you cannot use it here, so can add it in variable definition
}

####### OR USE  with no sensitive argument(comment line 4) !! ##########

resource "local_sensitive_file" "db_password" {
  content  = var.db_password
  filename = "${path.module}/db_password.txt"
}

output "db_password" {
  value     = var.db_password
  sensitive = true # without this line, error will be thrown
}

#### Actual usage #####
#### password is still not set explicitely as sensitive, yet it is not printed in the output #####

# resource "aws_db_instance" "default" {
#   allocated_storage    = 10
#   db_name              = "mydb"
#   engine               = "mysql"
#   engine_version       = "8.0"
#   instance_class       = "db.t3.micro"
#   username             = "foo"
#   password             = var.db_password
#   parameter_group_name = "default.mysql8.0"
#   skip_final_snapshot  = true
# }