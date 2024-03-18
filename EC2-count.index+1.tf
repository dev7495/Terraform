provider "aws" {
  region                   = "us-east-2"
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
}

resource "aws_instance" "ec1" {
  ami           = var.ami.0
  instance_type = var.t2.t2
  count         = 2
  tags = {   
    Name = "Server${count.index + 1}" 
    # count argument is mandatory to use count.index
  }
}

variable "ami" {
  type    = list(string)
  default = ["ami-0f5daaa3a7fb3378b"]
}

variable "t2" {
  type = map(string)
  default = {
    t2 = "t2.micro"
    t3 = "sample"
    t4 = "sample2"
  }
}

