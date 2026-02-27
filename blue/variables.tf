#################################
# AWS Provider
#################################

provider "aws" {
  region = var.aws_region
}

#################################
# Variables
#################################

variable "aws_region" {
  description = "AWS Region"
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "EC2 Instance Type"
  default     = "t2.medium"
}

variable "subnet_ids" {
  description = "List of subnet IDs for ALB and EC2"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID for ALB and EC2"
  type        = string
}

variable "environment" {
  description = "Environment name: blue or green"
  default     = "blue"
}