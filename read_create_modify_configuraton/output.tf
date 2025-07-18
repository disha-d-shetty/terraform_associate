######### Output the variables/datasource returned values & splat expression usage ###########

# just having this block is enough.
# On terminal :: Eg :: public_ip_of_eip = "10.0.0.2"
output "public_ip_of_eip" {
  # 2 EIPs created using count, will be outputed here
  value = aws_eip.public_ip[*].public_ip
}
output "ami_id" {
  value = data.aws_ami.example.id
}