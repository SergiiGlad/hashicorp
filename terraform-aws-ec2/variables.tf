
variable "aws_region" {
  description = "AWS region"
  default = "us-east-1"
}

variable "ami_id" {
  description = "ID of the AMI to provision. EC2 AWS Linux 2"
  default = "ami-04681a1dbd79675a5"
}

variable "instance_type" {
  description = "type of EC2 instance to provision."
  default = "t2.micro"
}





