resource "aws_instance" "ec2_instance" {
  ami = "ami-0ad21ae1d0696ad58"
  instance_type = "t2.medium"
  tags = {
    Name ="test-instance"
  }
}