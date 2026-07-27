terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_instance" "example" {
  launch_template {
    name = "my-template"
  }
  
  dynamic "ebs_block_device" {
    for_each = var.disks
    content {
      device_name = ebs_block_device.device
      volume_size  = ebs_block_device.volume_size 
    }
  }
}
