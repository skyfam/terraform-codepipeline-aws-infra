resource "aws_codebuild_project" "codebuild_project_plan_stage" {
  name          = var.codebuild_plan_project_name
  description   = "Terraform Planning Stage for infra VPC"
  service_role  = aws_iam_role.codebuild-role.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "hashicorp/terraform:latest"
    type                        = "LINUX_CONTAINER"
 }
 
  source {
     type   = "CODEPIPELINE"
     buildspec = file("buildspec/plan-buildspec.yml")
 }
}

resource "aws_codebuild_project" "codebuild_project_apply_stage" {
  name          = var.codebuild_apply_project_name
  description   = "Terraform Apply Stage for infra VPC"
  service_role  = aws_iam_role.codebuild-role.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "hashicorp/terraform:latest"
    type                        = "LINUX_CONTAINER"
 }

  source {
     type   = "CODEPIPELINE"
     buildspec = file("buildspec/apply-buildspec.yml")
 }
}

resource "aws_codebuild_project" "codebuild_project_destroy_stage" {
  name          = var.codebuild_destroy_project_name
  description   = "Terraform Destroy Stage for infra VPC"
  service_role  = aws_iam_role.codebuild-role.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "hashicorp/terraform:latest"
    type                        = "LINUX_CONTAINER"
 }

  source {
     type   = "CODEPIPELINE"
     buildspec = file("buildspec/destroy-buildspec.yml")
 }
}

resource "aws_codebuild_source_credential" "github" {
  auth_type   = "PERSONAL_ACCESS_TOKEN"
  server_type = "GITHUB"
  token       = jsondecode(data.aws_secretsmanager_secret_version.creds.secret_string)["github_access_token"]
}