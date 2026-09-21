# AWS DevOps Project

AWS上にWebアプリケーション環境とCI/CDパイプラインを構築し、TerraformでInfrastructure as Code（IaC）管理を実践したDevOpsポートフォリオです。

## Architecture

```text
GitHub
   │
   ▼
CodePipeline
   │
   ├─ CodeBuild
   │
   └─ CodeDeploy
          │
          ▼
      EC2 / ASG
          │
         Nginx
          │
          ▼
         ALB
          │
          ▼
       Internet

       EC2
        │
        ▼
    RDS PostgreSQL
```

## AWS Services

- **Network:** VPC, Subnet, Route Table, Internet Gateway
- **Compute:** EC2, Auto Scaling
- **Load Balancing:** ALB
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
