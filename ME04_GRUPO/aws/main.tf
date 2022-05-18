terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

#aqui finaliza configuracion del provider

resource "aws_security_group" "allow_ssh" {
 name        = "allow_ssh"
 description = "Allow ssh inbound traffic"
 vpc_id      = "vpc-0ee2c52774c1edda0"
 
 ingress {
   description      = "SSH from VPC"
   from_port        = 22
   to_port          = 22
   protocol         = "tcp"
   cidr_blocks      = ["0.0.0.0/0"] 
 }

   # To Allow Port 3000 Transport - api
  ingress {
    from_port = 3000
    protocol = "tcp"
    to_port = 3000
    cidr_blocks = ["0.0.0.0/0"]
  }
 
 egress {
   from_port        = 0
   to_port          = 0
   protocol         = "-1"
   cidr_blocks      = ["0.0.0.0/0"]
 }
 
 tags = {
   Name = "allow_ssh"
 }
}

data "template_file" "userdata" {
  template = file("${path.module}/instalacion.sh")
}

resource "aws_instance" "ec2_apirappi" {
  ami = "ami-0c4f7023847b90238"
  instance_type = "t2.micro"
  key_name = "pablo_rsa"
  vpc_security_group_ids = [
    aws_security_group.allow_ssh.id
  ]
  user_data = data.template_file.userdata.rendered
  tags = {
    Name = "EC2 api rappi"
  }
}
