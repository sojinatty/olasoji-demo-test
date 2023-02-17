variable "vpc_cidr" {
  description = "vpc cidr block "
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_az1" {
  description = " cidr block public subnet az1"
  type        = string
  default     = "10.0.0.0/24"
}

variable "public_subnet_az2" {
  description = "vpc cidr block public subnet az2 "
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_az1" {
  description = "vpc cidr block private subnet az1 "
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_subnet_az2" {
  description = "vpc cidr block private subnet az2 "
  type        = string
  default     = "10.0.3.0/24"
}


variable "my_ami" {
  description = "instance ami "
  type        = string
  default     = "ami-0dfcb1ef8550277af"
}





