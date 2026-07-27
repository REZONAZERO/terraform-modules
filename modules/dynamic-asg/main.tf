terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_autoscaling_group" "example" {
  launch_template {
    name = "my-template"
  }
  min_size = 2
  max_size = 5
  dynamic "tag" {
    for_each = merge(var.common_tags, var.extra_tags)
    content {
      key = tag.key
      value = tag.value
      propagate_at_launch = tag.key == "Environment" && tag.value == "prod" ? false : true
    }
  }
}
