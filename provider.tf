terraform {
  required_version = ">= 1.11.0, < 2.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.94.0"
    }
  }

  backend "s3" {
    bucket  = "terraform-cicd-aws-pipeline"
    encrypt = true
    key     = "terraform.state"
    region  = "ap-south-1"
  }
}

provider "aws" {}
