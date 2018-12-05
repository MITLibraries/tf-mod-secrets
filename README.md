This module can be used to create an AWS secret. Currently, the only
use case we have is for a static third party secret. This module does
not support rotation. All it will do is create an empty secret. Adding
the actual secret content can be done by either manually updating it
through the AWS console or by using the write policy to update it through
some other means.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | The Name of the application or solution  (e.g. `bastion` or `portal`) | string | - | yes |
| tags | Additional tags (e.g. `map('BusinessUnit','XYZ')`) | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| read\_policy | Read policy ARN for the AWS secret |
| secret | Secret ARN |
| write\_policy | Write policy ARN for the AWS secret |

