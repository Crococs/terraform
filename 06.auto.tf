resource "aws_launch_configuration" "korean_lacf" {
  name = "korean-lacf"
  image_id = aws_ami_from_instance.korean_ami.id
  instance_type = var.ins_type
  iam_instance_profile = var.ins_profile
  security_groups = [aws_security_group.korean_sg.id]
  key_name = var.key
  user_data = <<-EOF
            #!/bin/bash
            systemctl start httpd
            systemctl enable httpd
            EOF
}

resource "aws_placement_group" "korean_pg" {
  name = "${var.name}-pg"
  strategy = var.strategy
}

resource "aws_autoscaling_group" "korean_atsg" {
  name = "${var.name}-atsg"
  min_size = 2
  max_size = 10
  health_check_grace_period = 60
  health_check_type = var.health_type
  desired_capacity = 2
  force_delete = true
  launch_configuration = aws_launch_configuration.korean_lacf.name
  #placement_group = aws_placement_group.korean_pg.id
  vpc_zone_identifier = [aws_subnet.korean_pub[0].id, aws_subnet.korean_pub[1].id]
}

resource "aws_autoscaling_attachment" "korean_asatt" {
  autoscaling_group_name = aws_autoscaling_group.korean_atsg.id
  alb_target_group_arn = aws_lb_target_group.korean_albtg.id
}