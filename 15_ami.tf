resource "aws_ami_from_instance" "korean_ami" {
  name = "korean-ami"
  source_instance_id = aws_instance.korean_web.id

  depends_on = [aws_instance.korean_web]
  tags = {
    "Name" = "korean-ami"
  }
}