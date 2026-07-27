![Terraform Version](https://img.shields.io/badge/terraform-%3E%3D1.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)

# Terraform Modules Collection

Коллекция модулей для обучения и демонстрации навыков.

## Модули
- `archive` — архивирует конфиг в zip
- `database` — генерирует конфиг БД
- `devices-flatten` — демонстрирует работу с `flatten` и `for_each`
- `dynamic-asg` — Auto Scaling Group с динамическими тегами
- `dynamic-ebs-block-device` — EBS-блоки через `dynamic`
- `dynamic-tags` — динамические теги для ASG
- `greeter` — генерация приветствий с random_pet

## Использование
\`\`\`hcl
module "example" {
  source = "./modules/devices-flatten"
  rooms  = var.rooms
}
\`\`\`
