variable "common_tags" {
  type = map(string)
  default = {
    Environment = "dev"
    Project     = "terraform-asg-practice"
  }
}

variable "extra_tags" {
  type = map(string)
  default = {
    AutoScalingGroup = "web-asg"
    Team             = "platform"
  }
}
