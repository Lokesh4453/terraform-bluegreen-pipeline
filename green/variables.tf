#################################
# AWS Region
#################################

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-1"
}

#################################
# EC2 Instance Type
#################################

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

#################################
# AMI ID
#################################

variable "ami_id" {
  description = "AMI ID for the instance or launch template"
  type        = string
}

#################################
# VPC ID
#################################

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

#################################
# Subnet IDs
#################################

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}

#################################
# Key Pair Name
#################################

variable "key_name" {
  description = "Key pair name"
  type        = string
}

#################################
# Environment
#################################

variable "environment" {
  description = "Environment name: blue or green"
  type        = string
}

#################################
# Auto Scaling Group Settings
#################################

variable "asg_min_size" {
  description = "Minimum size of the ASG"
  type        = number
  default     = 1
}

variable "asg_max_size" {
  description = "Maximum size of the ASG"
  type        = number
  default     = 2
}