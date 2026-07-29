variable "vpc_config" {
  description = "VPC configuration"
  type = object({
    cidr_block = string
    name       = string
    azs        = list(string)
    public_subnets = list(string)
    private_subnets = list(string)
  })
  default = {
    cidr_block = "10.0.0.0/16"
    name       = "my-vpc"
    azs        = ["eu-central-1a", "eu-central-1b"]
    public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
    private_subnets = ["10.0.10.0/24", "10.0.20.0/24"]
  }
}
