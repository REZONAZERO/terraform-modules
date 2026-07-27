# Terraform Modules Collection

![Terraform Version](https://img.shields.io/badge/terraform-%3E%3D1.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)

Коллекция модулей для обучения и демонстрации навыков работы с Terraform: `dynamic` блоки, `for_each`, `flatten`, модульная структура.

---

## 📦 Модули

| Модуль | Описание | Ключевые фичи |
|--------|----------|---------------|
| [`archive`](modules/archive) | Архивирует конфиг в zip | `archive_file` |
| [`data-http`](modules/data-http) | Работа с HTTP data source | `data "http"` |
| [`database`](modules/database) | Генерирует конфиг БД | `templatefile`, `local_file` |
| [`devices-flatten`](modules/devices-flatten) | Демонстрация `flatten` и `for_each` | `flatten`, `for_each` |
| [`dynamic`](modules/dynamic) | Базовый пример `dynamic` блоков | `dynamic` |
| [`dynamic-asg`](modules/dynamic-asg) | Auto Scaling Group с динамическими тегами | `dynamic`, `aws_autoscaling_group` |
| [`dynamic-basic`](modules/dynamic-basic) | Простейший `dynamic` блок | `dynamic` |
| [`dynamic-ebs-block-device`](modules/dynamic-ebs-block-device) | EBS-блоки через `dynamic` | `dynamic`, `ebs_block_device` |
| [`dynamic-tags`](modules/dynamic-tags) | Динамические теги для ASG | `dynamic`, `tags` |
| [`greeter`](modules/greeter) | Генерация приветствий с `random_pet` | `random_pet`, `local_file` |
| [`loop`](modules/loop) | Демонстрация `count` и циклов | `count` |
| [`loop2`](modules/loop2) | Демонстрация `count` (вариация) | `count` |
| [`regions-flatten`](modules/regions-flatten) | Flatten на примере регионов | `flatten`, `for_each` |
| [`services-flatten-practice`](modules/services-flatten-practice) | Flatten на примере сервисов | `flatten`, `for_each` |
| [`some-module/data_source_example`](modules/some-module/data_source_example) | Пример data source | `data` |
| [`usr-groups`](modules/usr-groups) | Управление пользовательскими группами | `for_each` |
| [`vpc`](modules/vpc) | Базовый VPC модуль | `aws_vpc`, `aws_subnet` |
| [`webapp`](modules/webapp) | Деплой веб-приложения | `aws_instance`, `user_data` |

---

## 🚀 Использование

```hcl
module "example" {
  source = "./modules/devices-flatten"
  rooms  = var.rooms
}
