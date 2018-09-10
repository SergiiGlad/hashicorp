provider "aws" {
  region = "${var.aws_region}"
   
}

resource "aws_instance" "linux2" {
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  availability_zone = "${var.aws_region}a"
  key_name        = "${aws_key_pair.my-key.key_name}"
  security_groups = ["${aws_security_group.allow.name}"]
  

  tags {
    Name = "Demo2"
  }


 
  
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
            private_key = "${file("d:\\aws\\keypair-uaeast1.pem")}"
          }
  }
 
}

resource "aws_key_pair" "my-key" {
  key_name   = "my-key"

  public_key = "${file("d:\\aws\\test-public-key.pub")}"
}

resource "aws_security_group" "allow" {
  name = "allow_all"
  # SSH access
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  
}

resource "aws_eip" "base" { 
  instance = "${aws_instance.linux2.id}" 
  vpc = true 
}


