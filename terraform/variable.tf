# Declare Keyname variable
# variable "key_name" {
#   type        = string
#   default     = "mykey"
#   description = "Key name"
# }

variable "cidr_blocks" {
  type        = list(string)
  default     = ["cidr_block"]
  description = "Custome cidr range"
}

variable "key_name" {
  type        = string
  default     = "tf_key"
  description = "Key name"
}

# Declare kms id data type
variable "kms_key_id" {
  type        = string
  description = "KMS ID"
}

# Configure provider variable
variable "aws_access_key_id" {
  type        = string
  description = "Access key"
  }

variable "aws_secret_access_key"{
  type        = string
  description = "Secret Key"
}


# Configure public key
variable "ssh_path" {
  type        = string
  description = "Public key for the keypair"
}

# Set default data type for ami
variable "ami_id" {
  type        = string
  default     = "ami-0568773882d492fc8"
  description = "Linux ami"
}


# Set list string for ec2-type
variable "instance_type" {
  type        = list(string)
  default     = ["t2.micro", "t3.nano", "t3.micro"]
  description = "instance type"
}


# Set default data type for VPC
variable "vpc_id" {
  type        = string
  default     = "vpc-071830efdc6ebd583"
  description = "Default VPC"
}

# Provision availability zone
variable "region" {
  type        = string
  default     = "us-east-2"
  description = "Availability zone for deployment of instance"
}
