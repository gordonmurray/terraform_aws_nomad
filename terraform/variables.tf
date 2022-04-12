variable "vpc_id" {
  type        = string
  description = "VPC to use"
}

variable "vpc_subnets" {
  type        = list(string)
  description = "Subnets to use"
}

variable "aws_ami_account_id" {
  type        = string
  description = "The account ID that owns the AMIs created by packer"
}

variable "instance_type" {
  type        = string
  default     = "t3.large"
  description = "Instance types to use for ec2 instances"
}

variable "my_ip_address" {
  type        = string
  description = "Your own IP for SSH access"
}
