resource "aws_eip" "for_instance" {
  domain   = "vpc"
  instance = var.instance_id
  provider = aws.default
}
resource "aws_eip" "for_instance_dev2" {
  domain   = "vpc"
  instance = var.instance_id
  provider = aws.dev2
}