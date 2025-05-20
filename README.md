# Terraform -Implement Application Load Balancer with Auto Scaling Group & EC2

## Introduction

This repo implements the provisions the following infrastructure on the AWS:

* CodeBuild.
* CodePipeline.
* IAM Roles.
* IAM Policies for CodeBuild & CodePipelines.
* S3 bucket to save build artifacts.


## Pre Requisites

You must have the following programs installed & configured properly on your machine:

* Terraform.
* AWS CLI.

## Installation

Clone the repo using the following:

```
# Using HTTPS

git clone https://github.com/srmklive/terraform-codepipeline-aws.git

# Using SSH
git clone git@github.com:srmklive/terraform-codepipeline-aws.git

```

## Configuring the code

> [!IMPORTANT]
> You should also rename the infrastructure being provisioned as per your liking.

> [!CAUTION]
> You must update the values mentioned below. The prefilled values referring to AMI & S3 buckets are really removed.

### Set S3 Bucket for Terraform State

> [!IMPORTANT]
> If you want to save Terraform state locally, just comment out the lines 10-14 in the **providers.tf** file.

If you intend to use S3 for saving your Terraform state, open the **providers.tf** file and change the lines 10-13 as per your own liking. Most probably you just need to update the `bucket` & `region` values.

### Set Github ARN.
Use the following link for setting Github connection for AWS CodePipeline:

https://docs.aws.amazon.com/dtconsole/latest/userguide/connections-create-github.html#connections-create-github-console

When the connection is setup, just add the name on the line 2 in the **main.tf** file. This demo is setup to use the following repo:

https://github.com/srmklive/ec2-elb-asg

### Running the code

```
terraform init
```

```
terraform plan -out="tf.plan"
```

```
terraform apply "tf.plan"
```