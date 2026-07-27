variable "rooms" {
  type = map(object({
    devices = list(object({
      name  = string
      type  = string
      watts = number
    }))
  }))
  default = {
    kitchen = {
      devices = [
        { name = "fridge", type = "socket", watts = 150 },
        { name = "microwave", type = "socket", watts = 800 },
        { name = "led_strip", type = "light", watts = 20 }
      ]
    }
    living_room = {
      devices = [
        { name = "tv", type = "socket", watts = 120 },
        { name = "floor_lamp", type = "light", watts = 60 },
        { name = "speaker", type = "socket", watts = 30 },
        { name = "ac", type = "socket", watts = 1500 }
      ]
    }
    bedroom = {
      devices = [
        { name = "night_light", type = "light", watts = 5 },
        { name = "phone_charger", type = "socket", watts = 15 }
      ]
    }
  }
}
