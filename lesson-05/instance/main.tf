resource "aws_instance" "lesson_05" {
  ami           = "ami-097a2df4ac947655f"
  instance_type = "t2.micro"
  key_name      = "aws_key"
  vpc_security_group_ids = [
    aws_security_group.sg_ssh.id,
    aws_security_group.sg_https.id,
    aws_security_group.sg_http.id
  ]


  tags = {
    Name = "Lesson_05"
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC9Hq2se/haHEw95rMWnsx9VXlROHBhLG2P2Av31GrdEJse6Fv27SabRntsOii6Kes+YUkHA3PFV0ZxpcLybJYSGqXEoYuO6DTagWO5N6o4nBPGdF8Z8K0pbHV1KV+ywWEKZH1wbPmaUkg76tPvw1K6cBcRaN2lFl7UNUUBJnzCV07r7i4s4P4076/TFJuZVC/z0PWZIPEx2DlcRMLqSV6DjSuQAjkN7Tn3H/KpWaiRVwhMfPIJBJa78TC+KYnFkv7nuPt152pSw5q81rhkJzP1urd9QPg0Hao6vrKRYQew2RnB2U7vxVYhRufC4dMXmS8TF/OeYeHdurgcUPgY7YN7i1CQeqgSB3bLekAClvx+sWuf38j+A3hP1eLFCcQMQLyIv+MZCwgSM1QGJmS0PZvEoEVq4hJQmzYgngknkqf/+xh8noAdwVun7dttgZqZsD4ri5BuVTpMqL61KcdnLqxmcUAfkl+L+9m9KO183h64L/JTuPtCT0F1qma9N44OrMKG6dXke1T03dj5JP0hsjOFolFVf+DJSc5zGQAe42fs7IfxUfRVmy6Bv2qhU/crTxE32ynGYaFDy86aIgz46mpABz24R2SNAsbCQeUdMSUVOnc4bQl+H8coOnC0bravzr+9HrBx2p7KIK16z6hMo+ODnoYCG5VzY7GYeLZutAjJ1Q== vboxuser@debian"
}

resource "aws_security_group" "sg_ssh" {
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
  }
}

resource "aws_security_group" "sg_https" {
  ingress {
    cidr_blocks = ["192.168.0.0/16"]
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
  }
}

resource "aws_security_group" "sg_http" {
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
  }
}