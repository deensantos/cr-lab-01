variable "vpc_address" {
  type = string
  default = "10.0.0.0/16"
}

variable "snet_dev_cidr"{
  type = string
  default = "10.0.1.0/24"
}

variable "az_sbnet_dev" {
  default = "us-east-2a"
}
