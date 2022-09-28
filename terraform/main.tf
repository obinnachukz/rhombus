# Declare provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure provider
provider "aws" {
  region                = var.region
  access_key            = var.aws_access_key_id
  secret_key            = var.aws_secret_access_key
}

# Get information on VPC
data "aws_vpc" "selected" {
  id = var.vpc_id
}

# Create Key-Pair from existing rsa.pub
# resource "aws_key_pair" "deployer" {
#   key_name   = "mykey"
#   public_key = file("${var.ssh_path}")
# }

# Create Key-Pair
resource "aws_key_pair" "tf_key" {
  key_name   = var.key_name
  public_key = tls_private_key.rsa.public_key_openssh
}

# RSA key of size 4096 bits
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "tf_key" {
    content  = tls_private_key.rsa.private_key_pem
    filename = "tf_key"
}

data "aws_availability_zones" "available" {
  state = "available"
}

# Provision subnet
resource "aws_subnet" "example" {
  vpc_id            = data.aws_vpc.selected.id
  availability_zone = data.aws_availability_zones.available.names[0]
  cidr_block        = cidrsubnet(data.aws_vpc.selected.cidr_block, 4, 1)
}

# Provision security group
resource "aws_security_group" "sg_terraform" {
  name        = "sg_terraform"
  description = "Allow TLS inbound traffic"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    description = "Inbound rules from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.selected.cidr_block]
  }

  ingress {
    description = "Inbound rules from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.selected.cidr_block]
  }

  ingress {
    description = "Whitelist my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg_terraform"
  }
}

# Provision instance
resource "aws_instance" "web" {
   ami                         = var.ami_id
   instance_type               = var.instance_type[0]
   security_groups             = ["sg_terraform"]
   key_name                    = var.key_name
   tags                        = {
     Name = "web"
   }
   root_block_device  {
      encrypted      = "true"
      volume_size    = 30
      volume_type    = "gp2"
      kms_key_id     = var.kms_key_id
   }
}
