output "filename" {
  value = local_file.greeting.filename
}

output "pet_name" {
 value = random_pet.pet.id
}
