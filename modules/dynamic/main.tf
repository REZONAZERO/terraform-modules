locals {
  combinations = flatten([
    for env in var.environments : [
      for file_key, file_name in var.files : {
        env       = env
        file_key  = file_key
        file_name = file_name
      }
    ]
  ])

  file_map = {
    for combo in local.combinations :
    "${combo.env}-${combo.file_key}" => combo
  }
}

resource "local_file" "config" {
  for_each = local.file_map

  filename = "apps/${each.value.env}/${each.value.file_name}"
  content  = "Environment: ${each.value.env}\nFile: ${each.value.file_name}\nDeployed by: NoExxxit"
}
