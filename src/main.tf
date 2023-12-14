terraform {
  # Run init/plan/apply with "backend" commented-out (ueses local backend) to provision Resources (Bucket, Table)
  # Then uncomment "backend" and run init, apply after Resources have been created (uses AWS)

  required_version = ">=0.13.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

/*module "vpc-infra" {
  source = "./modules/vpc"

  # VPC Input Vars
  vpc_cidr             = local.vpc_cidr
  availability_zones   = local.availability_zones
  public_subnet_cidrs  = local.public_subnet_cidrs
  private_subnet_cidrs = local.private_subnet_cidrs
}
module "ecs" {
  source = "./modules/ECS"
}*/

module "s3_configuration" {
  source = "./modules/S3" # Ruta al directorio del módulo S3

  bucket_name     = "nombre-de-tu-bucket" # Reemplaza con tu nombre de bucket
  index_document  = "index.html"
  region          = "us-west-1" # Cambia según tu región
}

output "cloudfront_domain_name" {
  description = "Nombre de dominio de CloudFront"
  value       = module.s3_configuration.cloudfront_domain_name
}

