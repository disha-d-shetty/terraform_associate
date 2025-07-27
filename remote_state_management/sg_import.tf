# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "sg-0d77fb2d12dd3f3ef"
resource "aws_security_group" "example" {
  description = "to test import function"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = ["123.0.0.0/8"]
    description      = "dev cluster allowed, message from configuration file"
    from_port        = 80
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 80
  }]
  name                   = "terraform"
  name_prefix            = null
  region                 = "us-east-1"
  revoke_rules_on_delete = null
  tags = {
    APPID            = ""
    BILLINGCODE      = "LPEP0002-EN-01-01-1000"
    BILLINGCONTACT   = "pdeepikaravali@deloitte.com"
    BUSINESSAREA     = ""
    CMS              = "us-deloitteplatformspilot"
    COUNTRY          = "US"
    CSCLASS          = "Confidential"
    CSQUAL           = "Intellectual Property"
    CSTYPE           = "Internal"
    ENVIRONMENT      = "NPD"
    FUNCTION         = "CON"
    GROUPCONTACT     = "DCI-NOC@deloitte.com"
    MEMBERFIRM       = "US"
    PRIMARYCONTACT   = "pdeepikaravali@deloitte.com"
    SECONDARYCONTACT = "gbehara@deloitte.com"
  }
  tags_all = {
    APPID            = ""
    BILLINGCODE      = "LPEP0002-EN-01-01-1000"
    BILLINGCONTACT   = "pdeepikaravali@deloitte.com"
    BUSINESSAREA     = ""
    CMS              = "us-deloitteplatformspilot"
    COUNTRY          = "US"
    CSCLASS          = "Confidential"
    CSQUAL           = "Intellectual Property"
    CSTYPE           = "Internal"
    ENVIRONMENT      = "NPD"
    FUNCTION         = "CON"
    GROUPCONTACT     = "DCI-NOC@deloitte.com"
    MEMBERFIRM       = "US"
    PRIMARYCONTACT   = "pdeepikaravali@deloitte.com"
    SECONDARYCONTACT = "gbehara@deloitte.com"
  }
  vpc_id = "vpc-00174d304a3c431b8"
}
