# Username needs for ssh connection 
variable "username" {
  default = "vagrant"
}

# User password needs for ssh connection and run sudo 
variable "password" {
  default = "vagrant"
}

# ip address of guest server
variable "host_ipaddr" {
  default = "192.168.123.33"
}

# This nameserver will add to system resolv.conf
variable "nameserver" {
  default = "nameserver 8.8.8.8"
}

#This hostname will be setted to guest server
variable "host_name" {
  default = "demopluse"
}



#change name for apply new configuration
resource "null_resource" "demo19" {

	provisioner "remote-exec" {
	inline = [
	"mkdir ~/folder",
	"echo ${var.password} | sudo -S bash -c 'echo ${var.nameserver} | tee -a /etc/resolv.conf'",
	"echo ${var.password} | sudo -S bash -c 'echo ${var.host_name} | tee /etc/hostname'",
	"echo ${var.password} | sudo -S bash -c 'systemctl restart systemd-hostnamed'"
	]

		connection {
			type     = "ssh"
			user = "${var.username}"
			#password = "${var.password}"
			private_key = "${file("D:\\terraform\\private_key")}"
			host = "${var.host_ipaddr}"
			
		}
	}
}
