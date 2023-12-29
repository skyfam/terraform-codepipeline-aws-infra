locals {
  envs = { for tuple in regexall("(.*)=(.*)", file(".env")) : tuple[0] => sensitive(tuple[1]) }
}

variable "aws_region" {
  type = string
  default = "us-east-1"
}

variable "git_repo_name" {
  type = string
  default = "srmklive/aws-codedeploy-ec2-alb"
}

variable "s3_bucket_name" {
    type = string
    default = "srmk-infra-vpc-backend"
}

variable "codebuild_role_name" {
    type = string
    default = "srmk-infra-vpc-codebuild-role" 
}

variable "codepipeline_role_name" {
    type = string
    default = "srmk-infra-vpc-codepipeline-role"
}

variable "codebuild_policy_name" {
    type = string
    default = "srmk-infra-vpc-codebuild-policy" 
}

variable "codepipeline_policy_name" {
    type = string
    default = "srmk-infra-vpc-codepipeline-policy"
}

variable "codebuild_plan_project_name" {
    type = string
    default = "srmk-infra-vpc-codebuild-project-plan" 
}

variable "codebuild_apply_project_name" {
    type = string
    default = "srmk-infra-vpc-codebuild-project-apply" 
}

variable "codebuild_destroy_project_name" {
    type = string
    default = "srmk-infra-vpc-codebuild-project-destroy" 
}

variable "codepipeline_name" {
    type = string
    default = "srmk-infra-vpc-codepipeline" 
}