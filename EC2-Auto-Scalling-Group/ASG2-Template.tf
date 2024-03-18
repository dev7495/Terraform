resource aws_launch_configuration home1 {
    name            = "home"
    image_id        = "ami-0f5daaa3a7fb3378b"
    instance_type   = "t2.micro"
    security_groups = ["default"]
    key_name        =  "ohio-win"
    user_data       =  <<EOF
                        #!/bin/bash
                        apt install nginx -y
                        mkdir -p /var/www/html
                        echo "$(hostname -i) Home" > /var/www/html/index.html
                        EOF
}

resource aws_launch_configuration mobile1 {
    name            =   "mobile"
    image_id        =   "ami-0f5daaa3a7fb3378b"
    instance_type   =   "t2.micro"
    security_groups =   ["default"]
    key_name        =   "ohio-win"
    user_data       =   <<EOF
                        #!/bin/bash
                        apt install nginx -y
                        mkdir -p /var/www/html/mobile
                        echo "$(hostname -i) Mobile > /var/www/html/mobile/index.html
                        EOF                   
}

resource aws_launch_configuration laptop1 {
    name            =   "laptop"
    image_id        =   "ami-0f5daaa3a7fb3378b"
    instance_type   =   "t2.micro"
    security_groups =   ["default"]
    key_name        =   "ohio-win"
    user_data       =   <<EOF
                        #!/bin/bash
                        apt install nginx -y
                        mkdir -p /var/www/html/mobile
                        echo "$(hostname -i) Mobile > /var/www/html/mobile/index.html
                        systemctl start nginx
                        systemctl enable nginx
                        EOF                   
}

