################# Undertsand the use of remote-exec provisioner(eg: to install nginx on server) ######################

locals {
  # file permission, chmod = 400/readonly
  ssh_private_key_path = "${path.module}/terraform.pem"
}
variable "vpc_id" {
  description = "The ID of the VPC where the instance will be launched"
  type        = string
  default    = "vpc-00174d304a3c431b8"
}

resource "aws_instance" "remote_exec" {
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = "t2.micro"
  subnet_id     = data.aws_subnet.selected.id
  # needed, even if the subnet has auto-assign public IP enabled
  # or have eip created and attached to instance
  associate_public_ip_address = true
  # ensure the key name is correct 
  key_name = "terraform" 
  vpc_security_group_ids = [aws_security_group.nginx_rule.id]
  tags = {
    Name = "remote-exec-instance"
  }
  # Establishes connection to be used by all
  connection {
    # for linux instances, windows - use winrm
    type     = "ssh" 
    user     = "ec2-user"
    # password is disabled in aws by default
    # password = var.root_password
    private_key = file(local.ssh_private_key_path)
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    # as user is ec2-user, so sudo is required
    inline = [
    "sudo yum -y install nginx",
    "sudo systemctl start nginx",
    "sudo systemctl enable nginx"
    ]
  }
}
# Output the public IP address to access the nginx 
output "remote_exec_instance_public_ip" {
  description = "The public IP address of the instance"
  value       = aws_instance.remote_exec.public_ip
}