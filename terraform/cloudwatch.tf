resource "aws_cloudwatch_log_group" "nginx_access" {
  name              = "/aws/devops/nginx/access"
  retention_in_days = 7
}

resource "aws_cloudwatch_log_group" "nginx_error" {
  name              = "/aws/devops/nginx/error"
  retention_in_days = 7
}