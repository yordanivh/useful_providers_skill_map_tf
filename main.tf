variable "animal" {}

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
