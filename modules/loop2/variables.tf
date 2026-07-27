variable "environments" {
  description = "Env vars"
  type        = list(string)
}

variable "files" {
  description = "Files env"
  type        = map(string)
}
