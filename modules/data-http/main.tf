terraform {
  required_providers {
    http = {
      source = "hashicorp/http"
      version = "~> 3.0"
    }
  }
}

data "http" "my_ip" {
  url = "https://api.ipify.org?format=json"
}

output "external_ip" {
  value = jsondecode(data.http.my_ip.response_body).ip
}
