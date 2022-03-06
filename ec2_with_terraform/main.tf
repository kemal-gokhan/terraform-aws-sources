resource "aws_instance" "cerberus" {
    ami = "ami-0ccc52d1499699b6b" 
    instance_type = "t2.micro"
    tags_all {
        name = "kemalgokhanterraform"
    }
}

variable "region" {
  default = "eu-central-1"
}


resource "aws_instance" "cerberus" {
    ami = "ami-06178cf087598769c"
    instance_type = "m5.large"
    key_name = "cerberus"
    user_data = file("/root/terraform-projects/project-cerberus/install-nginx.sh")
}
variable "region" {
  default = "eu-west-2"
}
resource "aws_key_pair" "cerberus-key" {
    key_name = "cerberus"
    public_key = file(".ssh/cerberus.pub")
}


---


resource "aws_instance" "cerberus" {
  ami           = var.ami
  instance_type = var.instance_type
  user_data     = file("./install-nginx.sh")

}
resource "aws_key_pair" "cerberus-key" {
  key_name   = "cerberus"
  public_key = file(".ssh/cerberus.pub")
}
resource "aws_eip" "eip" {
  vpc      = true
  instance = aws_instance.cerberus.id
  provisioner "local-exec" {
    command = "echo ${aws_eip.eip.public_dns} >> /root/cerberus_public_dns.txt"
  }

}
variable "ami" {
  default = "ami-06178cf087598769c"
}
variable "instance_type" {
  default = "m5.large"

}
variable "region" {
  default = "eu-west-2"
}