resource "local_file" "config" {
  count = length(var.environments) * length(var.files)
  
  env_index  = floor(count.index / length(var.file))
  file_index = count.index % length(var.files)

  env        = var.environments[env_index]
  file_key   = keys(var.files)[file_index]
  file_name  = var.files[file_key]

  filename   = "apps/${env}/${file_name}"
  content  = "Environment: ${env}\nFile: ${file_name}\nDeployed by: NoExxxit"
}

