terraform {
  required_version = ">= 1.0"
}

module "devices" {
  source = "../../modules/devices-flatten"
  rooms  = var.rooms
}

output "device_map" {
  value = module.devices.device_map
}
