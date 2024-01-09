provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web_instance" {
  count         = 3
  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI
  instance_type = "t2.micro"

  security_group_names = ["web_sg"]
}

resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow HTTP traffic"

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_elb" "web_elb" {
  name               = "web-elb"
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  instances = aws_instance.web_instance[*].id
}

resource "aws_route53_zone" "main" {
  name = "wi-otem.com.ug"
}

resource "aws_route53_record" "terraform_test" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "terraform-test"
  type    = "A"
  ttl     = "300"
  records = [aws_elb.web_elb.dns_name]
}

ooutput "public_ips" {
  value = aws_instance.web_instance[*].public_ip
  sensitive = true
  depends_on = [aws_elb.web_elb]
}


