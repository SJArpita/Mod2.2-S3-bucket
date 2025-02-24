locals {
 resource_prefix = "arp-tf"
}

resource "aws_instance" "public" {
 ami                         = "ami-053a45fff0a704a47" #Challenge, find the AMI ID of Amazon Linux 2 in us-east-1
 instance_type               = "t2.micro"
 subnet_id                   = "subnet-06fddac13e1b14ba3"
 associate_public_ip_address = true
 key_name                    = "arpita-keypair" #Change to your keyname, e.g. jazeel-key-pair
 vpc_security_group_ids = [aws_security_group.allow_ssh.id]
 tags = {
   Name = "${ local.resource_prefix }-ec2-${ var.env }" # Ensure your
 }
}

resource "aws_security_group" "allow_ssh" {
 name        = "${ local.resource_prefix }-s3-sg-ssh"
 description = "Allow SSH inbound"
 vpc_id      = data.aws_vpc.existing_ce9_vpc.id
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
 security_group_id = aws_security_group.allow_ssh.id
 cidr_ipv4         = "0.0.0.0/0" 
 from_port         = 22
 ip_protocol       = "tcp"
 to_port           = 22
}

resource "aws_s3_bucket" "lambda_bucket" {
  bucket = "arp-tf-s3" # replace with a unique name 
  force_destroy = true
}