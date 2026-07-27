variable "environments" {
  type = map(object({
    regions = list(string)
    instance_type = string
  }))
  default = {
    dev = {
      regions = ["us-east-1", "eu-west-1"]
      instance_type = "t2.micro"
    }
    prod = {
      regions = ["us-east-1", "eu-west-1", "ap-south-1"]
      instance_type = "m5.large"
    }
  }
}
