resource "aws_iam_role" "ec2" {
  name        = "aws-devops-ec2-role"
  description = "IAM role for AWS DevOps project EC2 instances"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ec2_cloudwatch" {
  role       = aws_iam_role.ec2.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

resource "aws_iam_role_policy_attachment" "ec2_ssm" {
  role       = aws_iam_role.ec2.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "ec2_codedeploy_s3" {
  role       = aws_iam_role.ec2.name
  policy_arn = "arn:aws:iam::498623467710:policy/aws-devops-codedeploy-s3-read"
}

resource "aws_iam_instance_profile" "ec2" {
  name = "aws-devops-ec2-role"
  role = aws_iam_role.ec2.name
}