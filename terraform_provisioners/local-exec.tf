########### Understand local-exec ###################

resource "aws_instance" "web" {
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = "t3.micro"
  subnet_id     = data.aws_subnet.selected.id
  # if u want public ip, then eip has to be added, cause default it is not assigned to instance
  provisioner "local-exec" {
    command = "echo ${self.arn}-${self.private_ip} >> instance_private_ips.txt"
  }
  # destroy & failure settings
  provisioner "local-exec" {
    when = destroy
    # even if this local-exec provisioner fails, the resource is destroyed successfully
    on_failure = continue
    command = "echo Instance has been destroyed"
  }
  tags = {name = "Terraform"}
}
