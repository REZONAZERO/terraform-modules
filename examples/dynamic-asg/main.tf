terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "asg" {
  source = "../../modules/dynamic-asg"

  vpc_zone_identifier = var.subnet_ids
  min_size            = 1
  max_size            = 2
  desired_capacity    = 1
  instance_type       = var.instance_type
  key_name            = var.key_name
  user_data           = var.user_data
}
