
#create a lunch template
#terraform create aws lunch template 
resource "aws_launch_template" "autoscaling_template" {
  name_prefix   = "autoscale_instance"
  image_id      = var.my_ami
  instance_type = "t2.micro"
  description   = "autoscale instance"
}

resource "aws_autoscaling_group" "asg" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 4
  max_size           = 5
  min_size           = 2

  launch_template {
    id      = aws_launch_template.autoscaling_template.id
    version = "$Latest"
  }
}