provider "aws" {
  region = "us-east-2"
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
}

resource aws_instance ec3{  
    ami = var.list1[0]                               # list       
    instance_type = var.t2                           # string
    associate_public_ip_address = var.bool1          # boolean - Not working.
} 

# Variables
variable list1{
    type = list(string)
    default = ["ami-0f5daaa3a7fb3378b", "2","3"]
}
variable t2 {
    default = "t2.micro"
}

variable bool1{             # not working
    type = bool
    default = false 
    }

# Output
output "output1" {
    value = "${var.t2}"
}

output private-ip {
    value = "${aws_instance.ec3.private_ip}"    # resource.resource-name.data-to-fetch
}

/*
output data-output{
    value = "${data.aws_subnet.name.id}" 
}

# ----------- DATA --------------------
 data "aws_subnet" "name"{
    tags = {
        Name = "Write-Subnet-Name-Here"
    } 
} 

/*
data "resource" "name"{
    tags = {
        Name = <resource-name-to-query-in-aws>
    }
} */

