output "cloudfront_domain_name" {
  description = "Nombre de dominio de CloudFront"
  value       = aws_cloudfront_distribution.s3_distribution.domain_name
}

output "other_output" {
  description = "Otras salidas"
  value       = "Valor"
}
