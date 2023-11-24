resource "aws_s3_bucket" "s3-bucket-backend" {
  bucket = var.s3_bucket_name
}

resource "aws_s3_bucket_ownership_controls" "s3-bucket-backend-ownership" {
  bucket = aws_s3_bucket.s3-bucket-backend.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "s3-bucket-backend-acl" {
  depends_on = [aws_s3_bucket_ownership_controls.s3-bucket-backend-ownership]
  
  bucket = aws_s3_bucket.s3-bucket-backend.id
  acl = "private"
}

resource "aws_s3_bucket_versioning" "s3-bucket-backend-versioning" {
  bucket = aws_s3_bucket.s3-bucket-backend.id
  versioning_configuration {
    status = "Disabled"
  }
}

resource "aws_s3_object" "terraform_folder" {
  bucket = aws_s3_bucket.s3-bucket-backend.id
  key    = "terraform_backend/"
}
