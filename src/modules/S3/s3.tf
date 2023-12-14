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

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = aws_s3_bucket.my_bucket.bucket_regional_domain_name
    origin_id   = "S3Origin"
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = var.index_document

  # Resto de la configuración de CloudFront...
}

output "cloudfront_domain_name" {
  description = "Nombre de dominio de CloudFront"
  value       = aws_cloudfront_distribution.s3_distribution.domain_name
}

