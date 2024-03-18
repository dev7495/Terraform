terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region                   = "us-east-2"
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
}
# ----------------- START -------------------------------- 

# Creating users ----------------------
resource "aws_iam_user" "u1" {
  name = "user1"
}

resource "aws_iam_user" "u2" {
  name = "user2"
}

# Creating groups -----------------------
resource "aws_iam_group" "g1" {
  name = "group1"
  # path = "/users/"
}

resource "aws_iam_group" "g2" {
  name = "group2"
  # path = "/users/"
}


# Adding 1 user to 1 group----------------------------
resource "aws_iam_user_group_membership" "u1g1" {  
  user = aws_iam_user.u1.name 

  groups = [aws_iam_group.g1.name]
} 


# Adding 1 user to multiple groups ----------------------------
resource "aws_iam_user_group_membership" "u1-g1g2" {  
  user = aws_iam_user.u2.name

  groups = [aws_iam_group.g1.name, aws_iam_group.g2.name]
}


/* Adding multiple users to 1 group. Did not work.

resource "aws_iam_user_group_membership" "u2g1" {  
  user = [aws_iam_user.u1.name, aws_iam_user.u2.name]

  groups = [aws_iam_group.g1.name]
} */