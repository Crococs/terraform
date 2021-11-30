resource "aws_db_instance" "korean_db" {
  allocated_storage      = 20
  storage_type           = var.st_type
  engine                 = var.engine
  engine_version         = var.engine_v
  instance_class         = var.ins_class
  name                   = var.db_name
  identifier             = var.db_iden
  username               = var.db_uname
  password               = var.db_pass
  parameter_group_name   = var.db_para
  availability_zone      = "${var.region}${var.ava_zone[0]}"
  db_subnet_group_name   = aws_db_subnet_group.korean_dbsg.id
  vpc_security_group_ids = [aws_security_group.korean_sg.id]
  skip_final_snapshot    = true
  tags = {
    "Name" = "${var.name}-db"
  }
}

resource "aws_db_subnet_group" "korean_dbsg" {
  name       = "${var.name}-dbsg"
  subnet_ids = [aws_subnet.korean_pridb[0].id,aws_subnet.korean_pridb[1].id]
}
