locals {
  instances = flatten([
    for env_name, env_config in var.environments : [
      for region in env_config.regions : {
        env = env_name
        region = region
        instance_type = env_config.instance_type
      }
    ]
  ])
  
  instance_map = {
    for item in local.instances :
    "${item.env}-${item.region}" => item
  }
}

resource "local_file" "config" {
  for_each = local.instance_map

  filename = "instances/${each.value.env}-${each.value.region}.txt"
  content  = "Environment: ${each.value.env}\nRegion: ${each.value.region}\nInstance type: ${each.value.instance_type}"
}
