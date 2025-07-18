########### Understand for_each metadata argument ###########

resource "aws_iam_user" "my_users" {
  # if variable is set, then each.value(always use this) == each.key(if needed)
  // if variable is map, then each.key and each.value is defined as key-value pair
  for_each   = var.iam_users
  name       = each.value
  tags       = var.tags_for_all
  depends_on = [data.aws_iam_policy_document.policy_creation]
}

resource "aws_iam_access_key" "lb" {
  for_each   = aws_iam_user.my_users
  user       = each.value.name
  depends_on = [aws_iam_user_policy.policy_attachment]
}

# this data source is used to create a policy document , how????!!!!!!!! explained in link below
// link - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document 
data "aws_iam_policy_document" "policy_creation" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:Describe*"]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "policy_attachment" {
  for_each = aws_iam_user.my_users
  name     = "policy_attachment"
  user     = each.value.name
  # convert the policy document to JSON format!
  policy   = data.aws_iam_policy_document.policy_creation.json
}