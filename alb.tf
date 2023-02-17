resource "aws_instance" "instance" {
  ami             = data.aws_ami.myami.id
  instance_type   = "t2.micro"
  user_data       = file("${path.module}/userdata.sh")
  security_groups = [aws_security_group.webserver.id]
}


#create application load balancer
#terraform create application load balancer
resource "aws_lb" "alb" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_security_group.id]



  subnet_mapping {
    subnet_id = aws_subnet.public_subnet_az1.id

  }

  subnet_mapping {
    subnet_id = aws_subnet.public_subnet_az2.id
  }

  enable_deletion_protection = false



  tags = {
    Environment = "dev"
  }
}
