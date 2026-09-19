resource "aws_autoscaling_group" "web" {
  name = "aws-devops-web-asg"

  min_size         = 1
  max_size         = 4
  desired_capacity = 1

  vpc_zone_identifier = [
    aws_subnet.public_1a.id,
    aws_subnet.public_1c.id
  ]

  target_group_arns = [
    aws_lb_target_group.web.arn
  ]

  health_check_type         = "ELB"
  health_check_grace_period = 300

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "aws-devops-web-server"
    propagate_at_launch = true
  }

  lifecycle {
    ignore_changes = [
      desired_capacity
    ]
  }
}