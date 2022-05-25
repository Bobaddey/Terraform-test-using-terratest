#Allow the instance to receive request on port 8080

resource "aws_security_group" "test_sg" {
  name        = "Flugel"
  description = "Allow TLS inbound traffic"

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_traffic"
  }
}