resource "aws_instance" "ec1" {
  ami                     = "ami-0f5daaa3a7fb3378b"
  instance_type           = "t2.micro"
  vpc_security_group_ids  = [aws_security_group.ssh.id, # Adding SG1
                            aws_security_group.http.id] # Adding SG2
}

resource "aws_security_group" "ssh" {                 # Creating SG 1
  name   = "sg1"
  vpc_id = var.vpc-id
}

resource "aws_security_group" "http" {                 # Creating SG 2
  name   = "sg1"
  vpc_id = var.vpc-id
}

# -------------------- Variables-----------------------------------------
variable "vpc-id" {                                # Variable - VPC-ID 
  default = "vpc-0558465a06dfccea6"
}


# ------------------ Output - Not needed --------------------------------
output "sg1" {                           
  value = aws_security_group.ssh.id
}

output "sg2" {
  value = aws_security_group.http
}

