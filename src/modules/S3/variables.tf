variable "bucket_name" {
  description = "Nombre del bucket S3"
  default     = "nombre-de-tu-bucket" # Reemplaza con tu nombre de bucket
}

variable "index_document" {
  description = "Documento de inicio en el bucket S3"
  default     = "index.html"
}

variable "region" {
  description = "Región AWS"
  default     = "us-west-2" # Cambia según tu región
}
