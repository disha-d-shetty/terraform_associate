############# Understand file() usage & meta-arguments #############

resource "aws_iam_role" "test_role" {
  name = "test_role"

  # normally you would pass the policy like this
  #   assume_role_policy = jsonencode({
  #     "Version": "2012-10-17",
  #     "Statement": [
  #         {
  #             "Effect": "Allow",
  #             "Action": [
  #                 "s3:Get*",
  #                 "s3:List*",
  #                 "s3:Describe*",
  #                 "s3-object-lambda:Get*",
  #                 "s3-object-lambda:List*"
  #             ],
  #             "Resource": "*"
  #         }
  #     ]
  # })


  # to make it loook cleaner use file function
  assume_role_policy = file("./iam_role_policy.json")
  tags               = var.tags_for_all

  lifecycle {
    create_before_destroy = true
    # it ll ignore manual changes + any terraform change related to argument/attribute
    ignore_changes  = [assume_role_policy]
    prevent_destroy = false
    # if you want to ignore all changes to resource , then use this
    # ignore_changes = all 
  }
}