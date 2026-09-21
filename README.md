# AWS DevOps Project

AWS上にWebアプリケーション環境とCI/CDパイプラインを構築し、TerraformによるInfrastructure as Code（IaC）管理を実践したDevOpsポートフォリオです。

## Architecture

```text
                         Internet
                            │
                            ▼
                           ALB
                            │
                   ┌────────┴────────┐
                   ▼                 ▼
                  EC2              EC2
                   │                 │
                 Nginx             Nginx
                   │                 │
                   └────────┬────────┘
                            │
                         RDS
                       PostgreSQL


GitHub
   │
   ▼
CodePipeline
   │
   ├── CodeBuild
   │
   └── CodeDeploy
          │
          ▼
      EC2 / ASG
```

## AWS Services

- **Network:** VPC, Subnet, Route Table, Internet Gateway
- **Compute:** EC2, Auto Scaling
- **Load Balancing:** Application Load Balancer (ALB)
- **Database:** RDS PostgreSQL
- **CI/CD:** CodePipeline, CodeBuild, CodeDeploy, S3
- **Monitoring:** CloudWatch, SNS
- **Operations:** Systems Manager
- **IaC:** Terraform
- **Source Control:** GitHub

## Main Features

- Public / Private Subnetによるネットワーク分離
- ALBによるEC2への負荷分散
- Auto ScalingによるEC2の自動スケーリング
- RDS PostgreSQLをPrivate Subnetに配置
- GitHub Pushを起点とした自動デプロイ
- TerraformによるAWS Infrastructure管理
- CloudWatchによるログ・メトリクス監視
- SSM Session ManagerによるEC2管理

## CI/CD Flow

```text
GitHub Push
     ↓
CodePipeline
     ↓
CodeBuild
     ↓
S3 Artifact
     ↓
CodeDeploy
     ↓
EC2
     ↓
Nginx
```

## Terraform

TerraformでAWS Infrastructureを管理しています。

```bash
terraform init
terraform validate
terraform plan
terraform apply
```

主なTerraform管理対象：

- VPC / Subnet / Route Table
- Security Groups
- ALB / Target Group
- EC2 / Launch Template / Auto Scaling
- RDS PostgreSQL
- IAM
- CodePipeline / CodeBuild / CodeDeploy
- CloudWatch / SNS