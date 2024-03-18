resource "aws_vpc" "vpc1" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "vpc1"
        env = "test"
    }    
}
# ------------------- SUBNET--------------------

resource aws_subnet private-subnet {
   vpc_id       = aws_vpc.vpc1.id
   cidr_block   = "10.0.1.0/24" 
   availability_zone =  "us-east-2a" 
    tags = {
        Name    = "subnet-private"
        env     = "test"
    }
}

resource aws_subnet public-subnet {
    vpc_id      = aws_vpc.vpc1.id
    cidr_block  =  "10.0.2.0/24"
    availability_zone = "us-east-2b"
 #   map_public_ip_launch = true
    tags = {
        Name    = "subnet-public"
        env     =  "test"
    }
}
# ------------------- IGW ------------------------

resource aws_internet_gateway igw1{
    vpc_id = "${aws_vpc.vpc1.id}"
    tags = {
        Name = "igw1"
        env = "test"
    }
}

# ----------- RTB -----------------

resource aws_default_route_table rtb1 {
    default_route_table_id = "${aws_vpc.vpc1.default_route_table_id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.igw1.id}"
        }
    tags = {
        Name = "rtb1"
        env = "test"
    }
}