variable "env" {
 description = "The environment of the AWS infrastructure"
 type        = string
 default     = "dev"
}

variable "vpc_name" {
 description = "The VPC Name to use"
 type        = string
 default     = "arpita-test-tr-vpc"
}

variable "subnet_name" {
 description = "The VPC Name to use"
 type        = string
 default     = "arpita-test-tr-vpc-public-us-east-1b"
}
