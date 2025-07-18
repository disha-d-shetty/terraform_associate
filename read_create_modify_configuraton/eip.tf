############ Understand count usage ############

resource "aws_eip" "public_ip" {
  domain = "vpc"
  # Using count.index to create unique tags for each EIP
  # its similar to looping
  tags = merge(
    { "Name" = "Terraform-${count.index}" },
    local.tags_for_eip
  )
  # usage of count
  count = 2
}