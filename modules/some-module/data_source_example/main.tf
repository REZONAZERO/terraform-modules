data "local_file" "config" {
  filename = "${path.module}/config.txt"
}

resource "local_file" "output" {
  filename = "output.txt"
  content  = data.local_file.config.content
}
