resource "aws_key_pair" "test_auth" {
  key_name   = "test-key"
  public_key = file("/home/runner/.ssh/tftestkey.pub")
}

resource "aws_instance" "Test_instance" {
  ami           = data.aws_ami.server_ami.id
  instance_type = "t2.micro"

  tags = {
    Name = "Flugel"
    Owner = "InfraTeam"
  }

  key_name = aws_key_pair.test_auth.id

  root_block_device{
    volume_size = 10
  }
}

resource "random_id" "s3_id" {
    byte_length = 2
}

resource "aws_s3_bucket" "devops_bucket" {
  bucket = "devops-bucket-${random_id.s3_id.dec}"
  
  tags = {
      Name = "Flugel"
      Owner = "InfraTeam"
  }
}
