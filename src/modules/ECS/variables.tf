variable "region" {
  description = "La región de AWS donde se desplegarán los recursos."
  type        = string
  default     = "us-east-1" # Cambia según tu región preferida
}

variable "vpc_cidr_block" {
  description = "Bloque CIDR para la VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_blocks" {
  description = "Bloques CIDR para las subredes públicas."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "ecs_cluster_name" {
  description = "Nombre del clúster ECS."
  type        = string
  default     = "my-cluster"
}

variable "task_family" {
  description = "Familia de la tarea ECS."
  type        = string
  default     = "my-app"
}

variable "container_image" {
  description = "Imagen del contenedor para la tarea ECS."
  type        = string
  default     = "nginx:stable-alpine3.17"
}

variable "container_port" {
  description = "Puerto del contenedor ECS."
  type        = number
  default     = 80
}
