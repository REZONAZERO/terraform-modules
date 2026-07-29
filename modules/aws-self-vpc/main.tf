terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

locals {
  all_subnets = flatten(concat(
    [ for cidr in var.vpc_config.public_subnets : {
        cidr      = cidr
        is_public = true
        az_index  = index(var.vpc_config.public_subnets, cidr)
      }
    ],
    [ for cidr in var.vpc_config.private_subnets : {
        cidr      = cidr
        is_public = false
        az_index  = index(var.vpc_config.private_subnets, cidr)
      }
    ]
  ))
  
  subnets_map = {
    for subnet in local.all_subnets :
    subnet.cidr => subnet
  }
}

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_config.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  
  tags = {
    Name = var.vpc_config.name
  }
}

resource "aws_subnet" "main" {
  for_each = local.subnets_map
  
  vpc_id     = aws_vpc.main.id
  cidr_block = each.value.cidr
  availability_zone = var.vpc_config.azs[each.value.az_index]
  
  tags = {
    Name = "${var.vpc_config.name}-${each.value.is_public ? "public" : "private"}-${each.value.az_index}"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  
  tags = {
    Name = "${var.vpc_config.name}-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  
  tags = {
    Name = "${var.vpc_config.name}-public-rt"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  
  tags = {
    Name = "${var.vpc_config.name}-private-rt"
  }
}

resource "aws_route_table_association" "main" {
  for_each = local.subnets_map
  
  subnet_id = aws_subnet.main[each.key].id
  route_table_id = each.value.is_public ? aws_route_table.public.id : aws_route_table.private.id
}
