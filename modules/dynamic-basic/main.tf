terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


resource "aws_security_group" "example" {
  name = "example-sg"

  dynamic "ingress" {
    for_each = var.ingress_rules
    
    content {
      description = ingress.key
      from_port = ingress.value.from_port
      to_port   = ingress.value.to_port
      protocol  = ingress.value.protocol
      cidr_blocks = ingrees.value.cidr_blocks
    }
  }   
}
