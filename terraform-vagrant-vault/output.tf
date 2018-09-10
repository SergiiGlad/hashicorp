output "user" {
	value = "${data.vault_generic_secret.foo.data["login"]}"
}

output "password" {
  sensitive = true
  value = "${data.vault_generic_secret.foo.data["password"]}"
}

output "host_ipaddr" {
  value = "${var.host_ipaddr}"
}


output "nameserver" {
  value = "${var.nameserver}"
}

output "host_name" {
  value = "${var.host_name}"
}