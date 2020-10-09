provider "aws"  {
 region = "eu-west-2"
}

resource "aws_security_group" "examplesg" {
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2_instance" {
  ami = "ami-038863f4c20d2d63d"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.examplesg.id}"]
  key_name = "uk"
  tags = {
    Name = "my-first-ec2-instance"
  }
}
