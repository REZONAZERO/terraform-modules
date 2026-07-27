terraform {
  required_providers {
    archive = {
      source  = "hashicorp/archive"
      version = "~> 1.0"
    }
  }
}

data "local_file" "config" {
  filename = "${path.module}/config.txt"
}

resource "archive_file" "config_zip" {
  type        = string
  source_file = data.local_file.config.filename
  output_file = "config.zip"
}
