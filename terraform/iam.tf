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

resource "aws_iam_policy" "codedeploy_s3_read" {
  name = "aws-devops-codedeploy-s3-read"


  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Sid    = "CodeDeployArtifactRead"
        Effect = "Allow"

        Action = [
          "s3:GetObject",
          "s3:GetObjectVersion"
        ]

        Resource = "${aws_s3_bucket.pipeline_artifacts.arn}/*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ec2_codedeploy_s3" {
  role       = aws_iam_role.ec2.name
  policy_arn = aws_iam_policy.codedeploy_s3_read.arn
}

resource "aws_iam_instance_profile" "ec2" {
  name = "aws-devops-ec2-role"
  role = aws_iam_role.ec2.name
}