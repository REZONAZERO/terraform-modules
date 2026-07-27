locals {
  userfiles = flatten([
    for group_key, user_list in var.groups : [
      for user in user_list : {
        user_group = group_key
        user_name  = user
      }
    ]
  ])

  user_map = {
    for combo in local.userfiles :
    "${combo.user_group}-${combo.user_name}" => combo
  }
}


resource "local_file" "userfile" {
  for_each = local.user_map
  
  filename = "users/${each.value.user_name}.txt"
  content  = "Group: ${each.value.user_group}"
}
