output "public_dns" {
  value = "${aws_instance.demo2.public_dns}"
}

output "public_ip" {
  value = "${aws_instance.demo2.public_ip}"
}



