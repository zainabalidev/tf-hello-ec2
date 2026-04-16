variable "instance_count" {
  type = number
  description = "Number of instances to create"
  default = 1
}

variable "instance_type" {
  type = string
  description = "The instance type for the server"
  default = "t3.micro"
}

variable "name_prefix" {
  type = string
  description = "The name of the user"
  default = "zainab"
}