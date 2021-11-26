resource "aws_placement_group" "korean_pg" {
  name = "korean-pg"
  strategy = "cluster"
}

resource "aws_autoscaling_group" "korean_atsg" {
  name = "korean-atsg"
  min_size = 2
  max_size = 10
  health_check_grace_period = 60
  health_check_type = "EC2"
  desired_capacity = 2
  force_delete = true
  launch_configuration = aws_launch_configuration.korean_lacf.name
  #placement_group = aws_placement_group.korean_pg.id
  vpc_zone_identifier = [aws_subnet.korean_puba.id, aws_subnet.korean_pubc.id]
}