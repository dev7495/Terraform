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


# Example1 > Any-Default1 ------------------------
resource aws_iam_user user1 {
  name = var.ex1
}

variable ex1 {
    type = any
    default = "dev"
}


# Example2 > Any-Default2 ------------------------
resource aws_iam_user user2 {
  name = var.ex2.person
}

variable ex2 {
    type = any
    default = {
      person = "modiji"
    }
}


# Example3 > Any-list ------------------------
resource aws_iam_user user3 {
  name = var.ex3.city[2]
}

variable ex3 {
    type = any
    default = {
      person = "modiji"
      city = ["indore", "bhopal", "delhi"]
    }
}


# Example4 > Any-map-list ------------------------
resource aws_iam_user user4 {
  name = var.ex4.hobbies.sport[0]
}

variable ex4 {
    type = any
    default = {
      person = "modiji"
      city = ["indore", "bhopal", "delhi"]
      hobbies = {
        watching = ["reels","youtube","roof"]
        sport = ["cricket","footbal"]
      }
    }
}