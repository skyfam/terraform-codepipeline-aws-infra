resource "random_id" "bucket_suffix" {
  byte_length = 6
}



# data "aws_s3_bucket" "s3-tf-state" {
#   bucket = "terraform-cicd-aws-pipeline"
# }



resource "aws_s3_bucket" "example_bucket" {
  bucket = data.aws_s3_bucket.s3-tf-state
}

output "bucket_name" {
  value = data.aws_s3_bucket.s3-tf-state
}



