terraform { #dependencias
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  }

  required_version = ">= 1.2"
}

#provedor
provider "aws" {
  region = "us-east-2"
}

#imagem
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical
}

#maquina1
resource "aws_instance" "lschmitt1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name = "lschmitt-key"
  subnet_id     = "XXXXX" #preencha 
  vpc_security_group_ids = ["XXXX"] #preencha
  associate_public_ip_address = true  
  tags = {
    Name = "lschmitt1"
  }
}

#maquina2
resource "aws_instance" "lschmitt2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name = "lschmitt-key"
  subnet_id     = "XXXXX" #preencha 
  vpc_security_group_ids = ["XXXX"] #preencha
  associate_public_ip_address = true  
  tags = {
    Name = "lschmitt2"
  }
}
