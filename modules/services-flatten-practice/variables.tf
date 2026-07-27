variable "services" {
  type = map(list(string))
  default = {
    web = [80, 443]
    api = [443, 8080]
    db  = [5432]
  }
}
