resource "aws_lb_target_group_attachment" "korean_albtgatt" {
  target_group_arn = aws_lb_target_group.korean_albtg.arn
  target_id        = aws_instance.korean_web.id
  port             = 80
}
