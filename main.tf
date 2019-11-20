variable "animal" {}

provider "aws" {
	region = "us-east-2"
}

resource "aws_instance" "example" {
	ami	      ="ami-0d5d9d301c853a04a"
	instance_type ="t2.micro"
	vpc_security_group_ids=[aws_security_group.instance.id]

	user_data = <<-EOF
		#!bin/bash
		echo "Hello Alvaro" > index.html
		nohup busybox httpd -f -p 8080 &
		EOF
}


resource "aws_security_group" "instance" {
	name = "terraform-example-instance2"
	ingress {
	  from_port   = 8080
	  to_port     = 8080
	  protocol    = "tcp"
	  cidr_blocks = ["0.0.0.0/0"]
	}
}

resource "random_id" "server" {
  #keepers = {
   # ami_id = "${var.ami_id}"  
    #}
    byte_length = 4
}


data "template_file" "setup" {
  template = "${file("setup.sh")}"

  vars = {
   animal= "${var.animal}"
 }
}

output "template" {
  value = "${data.template_file.setup.rendered}"
}

output "id" {
  value = "${random_id.server.hex}"
}