terraform {
  required_version = ">=1.0"
}

module "aws-self-vpc" {
  source = "./modules/aws-self-vpc"
}
