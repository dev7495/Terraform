provider "aws" {
  region = "us-east-2"
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
}

resource "aws_instance" "private-instance1" {
  ami           = var.ami[0]
  instance_type = var.t2

  tags = {
    Name = "private-instance"
    env  = "test"
  }
}

resource "aws_instance" "public-instance" {
  ami           = ""
  instance_type = var.t2

  tags = {
    Name = "public-instance"
    env  = "test"
  }
}

#-----------------Variable -----------------------------

variable "ami" {
  type    = list(string)
  default = ["ami-0f5daaa3a7fb3378b", "2", "3"]
}

variable "t2" {
  default = "t2.micro"
}
