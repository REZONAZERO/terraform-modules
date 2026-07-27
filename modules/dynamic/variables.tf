variable "environments" {
  description = "Env list"
  type        = list(string)
  default     = ["dev", "prod", "staging"]
}

variable "files" {
  description = "Files list"

  type    = map(string)
  default = {
    config   = "config.txt"
    database = "database.yaml"
    network  = "network.json"
  } 
}

