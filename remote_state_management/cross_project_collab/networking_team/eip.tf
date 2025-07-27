resource "aws_eip" "eip"{
    domain = "vpc"
}
output "eip" {
  value = aws_eip.eip.public_ip
}