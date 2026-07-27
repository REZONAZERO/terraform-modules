locals {
  devices = flatten([
    for room_name, room_data in var.rooms : [
      for device in room_data.devices : {
        room = room_name
        name = device.name
        type = device.type
        watts = device.watts
      }
    ]
  ])

  device_map = {
    for item in local.devices :
    "${item.room}-${item.name}" => item
  }
}

resource "local_file" "config" {
  for_each = local.device_map

  filename = "devices/${each.value.room}-${each.value.name}.txt"
  content  = "Room: ${each.value.room}\nDevice: ${each.value.name}\nType: ${each.value.type}\nPower: ${each.value.watts} W"
}
