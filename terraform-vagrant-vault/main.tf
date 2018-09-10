provider "vault" { }

data "vault_generic_secret" "foo" {  
        path = "secret/foo"
	}


#change name for apply new configuration or run terraform destroy
resource "null_resource" "demo23" {

	
	provisioner "remote-exec" {
	inline = [
	"mkdir ~/folder",
	"echo ${data.vault_generic_secret.foo.data["password"]} | sudo -S bash -c 'echo ${var.nameserver} | tee -a /etc/resolv.conf'",
	"echo ${var.host_name} | sudo tee /etc/hostname",
	"sudo systemctl restart systemd-hostnamed"
	]

		connection {
			type     = "ssh"
			user = "${data.vault_generic_secret.foo.data["login"]}"
			password = "${data.vault_generic_secret.foo.data["password"]}"
			host = "${var.host_ipaddr}"
			
		}
	}
}