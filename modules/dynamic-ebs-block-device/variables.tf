variable "disks" {
  type = list(object({
    device_name = string
    volume_size = number
    volume_type = optional(string, "gp2")
  }))
  default = [
    { device_name = "/dev/sdf", volume_size = 20 },
    { device_name = "/dev/sdg", volume_size = 30, volume_type = "gp3" }
  ]
}
