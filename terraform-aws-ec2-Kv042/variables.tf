variable "aws_region" {
  description = "AWS region"
  default = "us-east-2"
}

variable "ami_id" {
  description = "ID of the AMI to provision. EC2 AWS Linux 2"
  default = "ami-0cf31d971a3ca20d6"
}

variable "instance_type" {
  description = "type of EC2 instance to provision."
  default = "t2.micro"
}

variable "name" {
  description = "name to pass to Name tag"
  default = "Provisioned by Terraform"
}


variable "cmd1" {
  description = "command line for inline bash "
  default = "<html><head><title>NGINX server</title></head><body style=\"background-color\"></body></html>"
} 