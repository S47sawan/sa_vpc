variable "region" {
  type        = string
  description = "The AWS region."
  default     = "eu-west-2"
}

variable "environment" {
  type        = string
  description = "The name of our environment, i.e. development."
  default     = "development"
}

variable "key_name" {
  type        = string
  description = "The AWS key pair to use for resources."
  default     = "sa-keypair"
}

variable "vpc_cidr" {
  type        = string
  description = "The CIDR of the VPC."
}

variable "public_subnets" {
  type        = list(string)
  default     = []
  description = "The list of public subnets to populate."
}

variable "private_subnets" {
  type        = list(string)
  default     = []
  description = "The list of private subnets to populate."
}

variable "ami" {
  type = map(string)
  default = {
    eu-west-2 = "ami-0a244485e2e4ffd03"
    eu-west-1 = "ami-00c90dbdc12232b58"
    us-east-1 = "ami-09d56f8956ab235b3"

  }

  description = "The AMIs to use for web and app instances."
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The instance type to launch "
}

variable "bastion_instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The bastion host instance type."
}

variable "bastion_ami" {
  type = map(string)
  default = {
    eu-west-2 = "ami-0a244485e2e4ffd03"
    eu-west-1 = "ami-00c90dbdc12232b58"
    us-east-1 = "ami-09d56f8956ab235b3"

  }

  description = "The bastion host AMIs."
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Should be true if you want to use private DNS within the VPC"
  default     = true
}

variable "enable_dns_support" {
  type        = bool
  description = "Should be true if you want to use private DNS within the VPC"
  default     = true
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Should be false if you do not want to auto-assign public IP on launch"
  default     = true
}

output "vpc_id" {
  value = aws_vpc.environment.id
}

output "vpc_cidr" {
  value = aws_vpc.environment.cidr_block
}

output "bastion_host_dns" {
  value = aws_instance.bastion.public_dns
}

output "bastion_host_ip" {
  value = aws_instance.bastion.public_ip
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "public_route_table_id" {
  value = aws_route_table.public.id
}

output "private_route_table_id" {
  value = aws_route_table.private[*].id
}

output "default_security_group_id" {
  value = aws_vpc.environment.default_security_group_id
}
