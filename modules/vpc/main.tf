data "local_file" "config" {
  filename = "${path.module}/config.txt"
}


resource "local_file" "cidr_config" {
  filename = "VPC/${var.environment}/config.txt"
  content = <<-EOT
    VPC Configuration
    Environment: ${var.environment}
    CIDR: ${var.cidr}
    Deployed by: NoExxxit
    Date: ${timestamp()}
  EOT
}

resource "local_file" "output" {
  filename = "output.txt"
  content  = data.local_file.config.content
}
