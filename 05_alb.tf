resource "aws_lb" "korean_alb" {
  name = "${var.name}-alb"
  internal = false
  load_balancer_type = var.lb_type
  security_groups = [aws_security_group.korean_sg.id]
  subnets = [aws_subnet.korean_pub[0].id,aws_subnet.korean_pub[1].id]
  tags = {
    "Name" = "${var.name}-alb"
  }
}

resource "aws_lb_target_group" "korean_albtg" {
  name     = "${var.name}-albtg"
  port     = var.port_http
  protocol = var.pro_HTTP
  vpc_id   = aws_vpc.korean_vpc.id

  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 5
    matcher             = "200"
    path                = "/health.html"
    port                = var.port_traffic
    protocol            = var.pro_HTTP
    timeout             = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "korean_alblis" {
  load_balancer_arn = aws_lb.korean_alb.arn
  port = var.port_http
  protocol = var.pro_HTTP

  default_action {
    type = var.action_type
    target_group_arn = aws_lb_target_group.korean_albtg.arn
  }
}

resource "aws_lb_target_group_attachment" "korean_albtgatt" {
  target_group_arn = aws_lb_target_group.korean_albtg.arn
  target_id        = aws_instance.korean_web.id
  port             = var.port_http
}
