variable "project_name" {
  description = "プロジェクト名（リソース名のプレフィックス）"
  type        = string
  default     = "aws-devops"
}

variable "github_owner" {
  description = "GitHub オーナー名"
  type        = string
  default     = "fuguozhu"
}

variable "github_repo" {
  description = "GitHub リポジトリ名"
  type        = string
  default     = "aws-devops-project"
}

variable "github_branch" {
  description = "デプロイ対象ブランチ"
  type        = string
  default     = "main"
}

variable "codestar_connection_arn" {
  description = "CodeStar Connections (CodeConnections) の ARN"
  type        = string
  default     = "arn:aws:codeconnections:ap-northeast-1:498623467710:connection/4d75e837-87b0-44a4-91f6-4587d7500976"
}