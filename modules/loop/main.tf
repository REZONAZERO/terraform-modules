resource "local_file" "config" {
  for_each  = toset(var.environments)
  filename = "apps/${each.key}/config.txt"
  content   = "Environment: ${each.key}\nDeployed by: NoExxxit" 
}
