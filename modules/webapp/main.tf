resource "local_file" "webapp_config" {
  filename = "apps/${var.environment}/${var.app_name}/config.txt"
  content = <<-EOT
    Application: ${var.app_name}
    Environment: ${var.environment}
    Deployed by: NoExxxit
    Date: ${timestamp()}
  EOT
}
