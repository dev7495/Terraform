terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region                   = "us-east-2"
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
}
# ----------------- START --------------------------------

# 1 > terraform import aws_iam_user.<rs1> <user-name>
resource aws_iam_user rs1{
  name = "tf-user"
}



# 2.1 > terraform import aws_iam_user.<rs2>. <policy-arn>
resource aws_iam_policy rs2{
  name = "AdministratorAccess"
  policy = <policy-from-state-file> 
  description = "Provides full access to AWS services and resources."
}


# 2.2 > Above or this, either will work. Difference - Policy
resource aws_iam_policy rs2{
  name = "AdministratorAccess"
  description = "Provides full access to AWS services and resources."
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
})
}


#3 terraform import aws_iam_policy.<policy-name> <policy-arn>
resource "aws_iam_policy" "rs3" {
  description = "Allow Access Analyzer to analyze resource metadata"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "AccessAnalyzerServiceRolePolicy",
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:GetResourcePolicy",
          "dynamodb:ListStreams",
          "dynamodb:ListTables",
          "ec2:DescribeAddresses",
          "ec2:DescribeByoipCidrs",
          "ec2:DescribeSnapshotAttribute",
          "ec2:DescribeSnapshots",
          "ec2:DescribeVpcEndpoints",
          "ec2:DescribeVpcs",
          "ec2:GetSnapshotBlockPublicAccessState",
          "ecr:DescribeRepositories",
          "ecr:GetRepositoryPolicy",
          "elasticfilesystem:DescribeFileSystemPolicy",
          "elasticfilesystem:DescribeFileSystems",
          "iam:GetRole",
          "iam:ListEntitiesForPolicy",
          "iam:ListRoles",
          "iam:ListUsers",
          "iam:GetUser",
          "iam:GetGroup",
          "iam:GenerateServiceLastAccessedDetails",
          "iam:GetServiceLastAccessedDetails",
          "iam:ListAccessKeys",
          "iam:GetLoginProfile",
          "iam:GetAccessKeyLastUsed",
          "kms:DescribeKey",
          "kms:GetKeyPolicy",
          "kms:ListGrants",
          "kms:ListKeyPolicies",
          "kms:ListKeys",
          "lambda:GetFunctionUrlConfig",
          "lambda:GetLayerVersionPolicy",
          "lambda:GetPolicy",
          "lambda:ListAliases",
          "lambda:ListFunctions",
          "lambda:ListLayers",
          "lambda:ListLayerVersions",
          "lambda:ListVersionsByFunction",
          "organizations:DescribeAccount",
          "organizations:DescribeOrganization",
          "organizations:DescribeOrganizationalUnit",
          "organizations:ListAccounts",
          "organizations:ListAccountsForParent",
          "organizations:ListAWSServiceAccessForOrganization",
          "organizations:ListChildren",
          "organizations:ListDelegatedAdministrators",
          "organizations:ListOrganizationalUnitsForParent",
          "organizations:ListParents",
          "organizations:ListRoots",
          "rds:DescribeDBClusterSnapshotAttributes",
          "rds:DescribeDBClusterSnapshots",
          "rds:DescribeDBSnapshotAttributes",
          "rds:DescribeDBSnapshots",
          "s3:DescribeMultiRegionAccessPointOperation",
          "s3:GetAccessPoint",
          "s3:GetAccessPointPolicy",
          "s3:GetAccessPointPolicyStatus",
          "s3:GetAccountPublicAccessBlock",
          "s3:GetBucketAcl",
          "s3:GetBucketLocation",
          "s3:GetBucketPolicyStatus",
          "s3:GetBucketPolicy",
          "s3:GetBucketPublicAccessBlock",
          "s3:GetMultiRegionAccessPoint",
          "s3:GetMultiRegionAccessPointPolicy",
          "s3:GetMultiRegionAccessPointPolicyStatus",
          "s3:ListAccessPoints",
          "s3:ListAllMyBuckets",
          "s3:ListMultiRegionAccessPoints",
          "s3express:GetBucketPolicy",
          "s3express:ListAllMyDirectoryBuckets",
          "sns:GetTopicAttributes",
          "sns:ListTopics",
          "secretsmanager:DescribeSecret",
          "secretsmanager:GetResourcePolicy",
          "secretsmanager:ListSecrets",
          "sqs:GetQueueAttributes",
          "sqs:ListQueues"
        ],
        "Resource" : "*"
      }
    ]
  })
  path = "/aws-service-role/"
} 
