resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
  acl    = "private"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = "*",
      Action    = "s3:GetObject",
      Resource  = "${aws_s3_bucket.my_bucket.arn}/*",
      Condition = {
        StringLike = {
          "aws:Referer": "http://dxxxxxxxxxx.cloudfront.net/*"
        }
      }
    }]
  })
}
