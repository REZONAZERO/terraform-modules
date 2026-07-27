terraform {
  required_version = ">= 1.0"
}

module "greeter" {
  source = "../../modules/greeter"
  name   = "Friend"
}

output "greeting" {
  value = module.greeter.greeting
}
