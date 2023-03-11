# VPC Variables
variable "region" {
  default     = "us-east-1"
  description = "AWS Region"
  type        = string
}

variable "vpc-cidr" {
  default     = "10.0.0.0/16"
  description = "VPC CIDR Block"
  type        = string
}

variable "public-subnet-1-cidr" {
  default     = "10.0.0.0/24"
  description = "Public Subnet 1 CIDR Block"
  type        = string
}

variable "public-subnet-2-cidr" {
  default     = "10.0.1.0/24"
  description = "Public Subnet 2 CIDR Block"
  type        = string
}

variable "private-subnet-1-cidr" {
  default     = "10.0.2.0/24"
  description = "Private Subnet 1 CIDR Block"
  type        = string
}

variable "private-subnet-2-cidr" {
  default     = "10.0.3.0/24"
  description = "Private Subnet 2 CIDR Block"
  type        = string
}

variable "private-subnet-3-cidr" {
  default     = "10.0.4.0/24"
  description = "Private Subnet 3 CIDR Block"
  type        = string
}

variable "private-subnet-4-cidr" {
  default     = "10.0.5.0/24"
  description = "Private Subnet 4 CIDR Block"
  type        = string
}

# MySQL database variables

variable "rds_instance" {
  type = map(any)
  default = {
    allocated_storage   = 10
    engine              = "mysql"
    engine_version      = "8.0.28"
    instance_class      = "db.t2.micro"
    multi_az            = false
    name                = "CapstoneDB"
    skip_final_snapshot = true
  }
}

# Database sensitive variables
variable "user_information" {
  type = map(any)
  default = {
    username = "username"
    password = "password"
  }
  sensitive = true
}