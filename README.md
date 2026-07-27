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
