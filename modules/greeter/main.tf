terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

resource "random_pet" "pet" {
  length = 2
} 

resource "local_file" "greeting" {
  filename = "${var.folder}/${var.name}-${random_pet.pet.id}.txt"
  content  = "Hello! My name is ${var.name}. Today im in Jacko ${var.mood}. My id is - ${random_pet.pet.id} <3"
}
