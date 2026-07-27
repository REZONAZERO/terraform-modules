variable "rooms" {
  description = "Device map by room"
  type = map(object({
    devices = list(object({
      name = string
      type = string
      wats = number
    }))
  }))
  default = {
    living_room = {
      devices = [
        { name = "TV", type = "electronics", watts = 150 }
        { name = "Lamp", type = "lighting", watts = 60 }
      ]
    }
    kitchen = {
      devices = [
        { name = "Fridge", type = "appliance", watts = 300 }
      ]
    }
  }
}
