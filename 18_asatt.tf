resource "aws_autoscaling_attachment" "korean_asatt" {
  autoscaling_group_name = aws_autoscaling_group.korean_atsg.id
  alb_target_group_arn = aws_lb_target_group.korean_albtg.id
}