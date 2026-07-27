variable "instance_tags" {
  description = "Tags for EC2-instance"
  type = map(string)
  default = {
    Name        = "web-server"
    Environment = "dev"
    Project     = "terraform-course"
    Owner       = "student"
  }
}
