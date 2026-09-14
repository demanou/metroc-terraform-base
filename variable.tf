variable "region" {
  type        = string
  default     = "ca-central-1"
  description = "Enter Your Region Name"
}

variable "ami" {
  type        = string
  default     = "ami-06af26bdf96183d41"
  description = "Enter Your AMI ID"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Enter Your Instance Type"
}

variable "vpc_security_group_ids" {
  type        = string
  default     = "sg-018e63162a5f6b02e"
  description = "Enter VPC SG ID"
}

variable "bucket" {
  type        = string
  description = "Enter Bucket Name"
}

variable "subnet_id" {
  type        = string
  default     = "subnet-05badfe3396ca4402"
  description = "Enter VPC Subnet ID"
}