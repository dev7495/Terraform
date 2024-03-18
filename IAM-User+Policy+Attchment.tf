provider "aws" {
  region                   = "us-east-2"
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
}

# Creating user
resource "aws_iam_user" "user1" {
  name = "danav"
}

#Creating Policy
resource "aws_iam_policy" "policy1" {
  name = "tf-admin-policy"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "Stmt1710056144400",
        "Action" : "ec2:*",
        "Effect" : "Allow",
        "Resource" : "*"
      }
    ]
  })
}

# Attaching Policy to User
resource "aws_iam_user_policy_attachment" "attch1" {
  user       = aws_iam_user.user1.name
  policy_arn = aws_iam_policy.policy1.arn
}