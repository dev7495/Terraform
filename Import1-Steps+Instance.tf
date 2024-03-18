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

# Syntax > terraform import resource-type.resource-name <resource-import-reference>

# Step 1 - terraform import <aws_instance>.<rs1> <instance-id>

# Step 2 - Create block to store imported data. 

# Step 3 - cat terraform.tfstate

# Step 4 - terraform plan - Will show required field. Write all required fields in block.

resource "aws_instance" "rs1" {
  ami = "<ami-id>"
  instance_type = "<instance-type>"

  tags = {                               # Use only if instance has name.
    Name = "<instance-name>"
  }
} 


