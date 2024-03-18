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

# Source for output - Creating user
resource "aws_iam_user" "user1" {
  name = "dev" 
}

/* syntax
output output-name {
  value = source-resource.resource-name.attribute
} */


# Example 1 - Prints all details of user1. No attribute
output "out1put"{
    value = aws_iam_user.user1
}
# It also shows all attributes for resource



# Example 2 - Prints only arn of user1. With attribute1
output "output2"{
    value = aws_iam_user.user1.arn
}


# Example 3 - Prints only arn of user1. With attribute2
output "output3"{
    value = aws_iam_user.user1.name
}
