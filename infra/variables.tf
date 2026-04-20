variable "project_id" {
  type        = string
  description = "GCP project id to deploy into."
}

variable "region" {
  type        = string
  description = "Region for subnets and regional resources."
  default     = "us-central1"
}

variable "zone" {
  type        = string
  description = "Zone for Compute Engine instances."
  default     = "us-central1-a"
}

variable "my_ip_cidr" {
  type        = string
  description = "Your public IP in CIDR notation (example: 203.0.113.10/32) to allow SSH to vm-public."
}

variable "network_name" {
  type        = string
  description = "VPC name."
  default     = "vpc-lab"
}

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR for the public subnet."
  default     = "10.10.1.0/24"
}

variable "private_subnet_cidr" {
  type        = string
  description = "CIDR for the private subnet."
  default     = "10.10.2.0/24"
}

