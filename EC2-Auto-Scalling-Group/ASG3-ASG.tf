resource aws_autoscaling_group asg1 {
    name                    = "home-asg"
    launch_configuration    = "${aws_launch_configuration.home1.name}"
    max_size                =   2
    min_size                =   1
    desired_capacity        =   1
    vpc_zone_identifier     =   [aws_subnet.private-subnet.id, aws_subnet.public-subnet.id]
}

