variable "name" {
  description = "The Name of the application or solution  (e.g. `bastion` or `portal`)"
  type        = string
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit','XYZ')`)"
}

