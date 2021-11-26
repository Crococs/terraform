resource "aws_lb" "korean_alb" {
  name = "korean-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.korean_sg.id]
  subnets = [aws_subnet.korean_puba.id,aws_subnet.korean_pubc.id]
  tags = {
    "Name" = "korean-alb"
  }
}