
provider "aws" {
  region                   = "us-east-2"
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
}

resource "aws_instance" "ec1" {
  ami               = "ami-0f5daaa3a7fb3378b"
  instance_type     = "t2.micro"
  availability_zone = "us-east-2b"
  security_groups   = ["VM-HTTP"]
  key_name          = "ohio-win"

# User data not working
  user_data = <<EOT
                apt update -y
                apt install nginx -y
                mkdir -p /var/www/html
                echo "$(hostname -i)" > /var/www/html/index.html
                systemctl start nginx
                systemctl enable nginx
                EOT

tags = {
    Name = "VM1"
    env  = "test"
  }

}
