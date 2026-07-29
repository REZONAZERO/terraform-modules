# Terraform Modules Collection

![Terraform Version](https://img.shields.io/badge/terraform-%3E%3D1.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)

A collection of Terraform modules for learning and demonstrating skills: `dynamic` blocks, `concat`, `for_each`, `flatten`, module structure, and AWS integrations.

---

## 📦 Modules

| Module | Description | Key features |
|--------|-------------|--------------|
| [`archive`](modules/archive) | Archives config to zip | `archive_file` |
| [`aws-self-vpc`](modules/aws-self-vpc) | Creates VPC for subnets | `concat`, `subnets` |
| [`data-http`](modules/data-http) | HTTP data source example | `data "http"` |
| [`database`](modules/database) | Generates DB config | `templatefile`, `local_file` |
| [`devices-flatten`](modules/devices-flatten) | `flatten` + `for_each` demonstration | `flatten`, `for_each` |
| [`dynamic`](modules/dynamic) | Basic `dynamic` block example | `dynamic` |
| [`dynamic-asg`](modules/dynamic-asg) | Auto Scaling Group with dynamic tags | `dynamic`, `aws_autoscaling_group` |
| [`dynamic-basic`](modules/dynamic-basic) | Simplest `dynamic` block | `dynamic` |
| [`dynamic-ebs-block-device`](modules/dynamic-ebs-block-device) | EBS volumes via `dynamic` | `dynamic`, `ebs_block_device` |
| [`dynamic-tags`](modules/dynamic-tags) | Dynamic tags for ASG | `dynamic`, `tags` |
| [`greeter`](modules/greeter) | Greeting generation with `random_pet` | `random_pet`, `local_file` |
| [`loop`](modules/loop) | `count` and loops demonstration | `count` |
| [`loop2`](modules/loop2) | `count` variation | `count` |
| [`regions-flatten`](modules/regions-flatten) | Flatten on regions example | `flatten`, `for_each` |
| [`services-flatten-practice`](modules/services-flatten-practice) | Flatten on services example | `flatten`, `for_each` |
| [`some-module/data_source_example`](modules/some-module/data_source_example) | Data source usage | `data` |
| [`usr-groups`](modules/usr-groups) | User group management | `for_each` |
| [`vpc`](modules/vpc) | Basic VPC module | `aws_vpc`, `aws_subnet` |
| [`webapp`](modules/webapp) | Web app deployment | `aws_instance`, `user_data` |

---

## 📂 Examples

The [`examples/`](examples) folder contains ready-to-run usage scenarios:

- [`greeter`](examples/greeter) — greeting generation
- [`dynamic-asg`](examples/dynamic-asg) — Auto Scaling Group creation (requires AWS)
- [`devices-flatten`](examples/devices-flatten) — `flatten` + `for_each` demonstration

Each example includes a minimal `main.tf` and required variables.

---

## 🚀 Usage

```hcl
module "example" {
  source = "./modules/devices-flatten"
  rooms  = var.rooms
}
