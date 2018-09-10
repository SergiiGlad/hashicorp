

provider "aws" {
  region = "us-east-2"
   shared_credentials_file = "aws\\credentials.txt"
 
}


resource "aws_instance" "demo2" {
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  availability_zone = "${var.aws_region}a"
  key_name        = "${aws_key_pair.my-key.key_name}"

  subnet_id = "${aws_subnet.public.id}"
  vpc_security_group_ids = ["${aws_security_group.allow.id}"]
  
  provisioner "remote-exec" {
          inline = [
            
            "sudo yum -y install git",
            "git clone https://github.com/SergiiGlad/tf.git",
            "chmod +x tf/rocket.sh",
            "./tf/rocket.sh"
        
          ]

          connection {
            type = "ssh"
            user = "ec2-user"
            private_key = "${file("keypairs\\id_rsa")}"
          }
  }


  tags {
    ita_group = "Kv-042"
  }

  volume_tags {
    ita_group = "Kv-042"
  }

}

resource "aws_subnet" "public" {

  vpc_id = "vpc-ddf2a5b5"
  
  cidr_block = "10.0.2.0/24"
  availability_zone = "${var.aws_region}a"
  map_public_ip_on_launch = true

  tags {
    ita_group = "Kv-042"
  }

}

resource "aws_eip" "base" { 
  instance = "${aws_instance.demo2.id}" 
  
  vpc = true 
 
  tags {
    ita_group = "Kv-042"
  }
}



resource "aws_security_group" "allow" {
  name = "demo-2-start"
  # SSH access
  vpc_id      = "vpc-ddf2a5b5"

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags {
    ita_group = "Kv-042"
  }


}


resource "aws_key_pair" "my-key" {
  key_name   = "my-key"
  public_key = "${file("keypairs\\id_rsa.pub")}"
}