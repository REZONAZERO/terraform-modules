locals {
  services = flatten([
    for service_key, service_list in var.services : [
      for service in service_list : {
        service_key  = service_key
        service_name = service
      }
    ]
  ])
  
  service_map = {
    for combo in local.services :
    "${combo.service_key}-${combo.service_name}" => combo
  }
}

resource "local_file" "services" {
  for_each = local.service_map

  filename = "services/${each.value.service_key}-${each.value.service_name}.txt"
  content  = "Service: ${each.value.service_key}\nPort: ${each.value.service_name}"
}
