variable "environment" {
  description = "Dev/Prod environment"
  type        = string
}

variable "cidr" {
  description = "CIDR"
  type        = string
  default     = "10.0.0.0/16"
}
