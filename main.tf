resource "aws_instance" "webserver" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.vpc_security_group_ids]
  subnet_id              = var.subnet_id

  tags = {
    Name = "learn-terraform"
  }
}

resource "aws_kms_key" "s3Key" {
  description             = "S3 KMS Key"
  enable_key_rotation     = true
  deletion_window_in_days = 7
}

resource "aws_s3_bucket" "appBucket" {
  bucket = var.bucket

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3KmsAssignment" {
  bucket = aws_s3_bucket.appBucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.s3Key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

