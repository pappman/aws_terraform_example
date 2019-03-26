variable "vpc_cidr" {
    description = "CIDR for the VPC"
    default = "192.168.0.0/16"
}
variable "public_subnet" {
    description = "CIDR public"
    default = "192.168.1.0/24"
}
variable "private_subnet" {
    description = "CIDR private"
    default = "192.168.2.0/24"
}
variable "amis" {
    description = "AMIs by region"
    default = {
        #ca-central-1    = "ami-0427e8367e3770df1"
        ca-central-1    = "ami-01b60a3259250381b" # ubuntu
    }
}
variable "aws_region" {
    description = "Region for the VPC"
    default = "ca-central-1"
}
variable "zone_1" {
    description = "Availability Zone 1"
    default = "ca-central-1a"
}
variable "aws_instance_type" {
    description = "Instance type"
    default = "t2.small"
}
variable "aws_key_name" {
    description = "teste"
    default = "percis-canada"
}
