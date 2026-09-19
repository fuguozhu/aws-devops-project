resource "aws_launch_template" "web" {
  name        = "aws-devops-web-template"
  description = "v4 - CloudWatch Agent + CodeDeploy Agent"

  image_id      = "ami-0deabdf34b7cdc617"
  instance_type = "t3.micro"
  key_name      = "aws-devops-key"

  vpc_security_group_ids = [
    aws_security_group.web.id
  ]

  iam_instance_profile {
    arn = aws_iam_instance_profile.ec2.arn
  }

  user_data = filebase64("${path.module}/user_data.sh")

  lifecycle {
    ignore_changes = [
      image_id
    ]
  }
}