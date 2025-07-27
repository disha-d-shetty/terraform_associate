variable "dummy" {
  description = "A dummy variable for testing purposes"
  type        = string
  default     = "default_value1"
}
output "dummy_output" {
  value = var.dummy
}