resource "local_file" "db_config" {
  filename = "databases/${var.environment}/${var.db_name}/config.txt"
  content = <<-EOT
    Database: ${var.db_name}
    Environment: ${var.environment}
    Deployed by: NoExxxit
    Date: ${timestamp()}
  EOT
}
