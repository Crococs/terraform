resource "aws_launch_configuration" "korean_lacf" {
  name = "korean-lacf"
  image_id = aws_ami_from_instance.korean_ami.id
  instance_type = "t2.micro"
  iam_instance_profile = "admin_role"
  security_groups = [aws_security_group.korean_sg.id]
  key_name = "korean1-key"
  user_data = <<-EOF
            #!/bin/bash
            systemctl start httpd
            systemctl enable httpd
            EOF
}