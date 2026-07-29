# AWS VPC Module

Creates VPC with public and private subnets in available zones.

## Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| vpc_config | VPC configuration | object | see `variables.tf` |

## Outputs

| Name | Description |
|------|-------------|
| vpc_id | ID of created VPC |
| public_subnet_ids | IDs of public subnets |
| private_subnet_ids | IDs of private subnets |

## Example

```hcl
module "vpc" {
  source = "./modules/aws-self-vpc"
  vpc_config = {
    cidr_block      = "10.0.0.0/16"
    name            = "my-vpc"
    azs             = ["eu-central-1a", "eu-central-1b"]
    public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
    private_subnets = ["10.0.10.0/24", "10.0.20.0/24"]
  }
}
