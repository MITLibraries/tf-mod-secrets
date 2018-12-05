variable "name" {
  description = "The Name of the application or solution  (e.g. `bastion` or `portal`)"
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit','XYZ')`)"
}
