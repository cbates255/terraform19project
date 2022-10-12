variable "dockerimage" {
  default = "centos8"
}

variable "vpccidr" {
  default = "10.0.0.0/16"
}

variable "subnet1cidr" {
  default = "10.0.1.0/24"
}

variable "subnet2cidr" {
  default = "10.0.2.0/24"
}