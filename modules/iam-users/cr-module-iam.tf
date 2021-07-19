resource aws_iam_user "uname" {
  name = var.name
  tags = {
    Company = var.company
    Department = var.department
  }
}

resource aws_iam_group "cr-admin-aws" {
  name = "cr-admin-aws"
}

resource aws_iam_user_group_membership "add_to_admin_group" {
  user = aws_iam_user.uname.name

  groups = [
    aws_iam_group.cr-admin-aws.name
  ]
}
