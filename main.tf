terraform {
  required_version = ">=1.0"
}

module "dynamic-ebs" {
  source = "./modules/dynamic-ebs-block-device"
}
