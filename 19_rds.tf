resource "aws_db_instance" "korean_db" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t2.micro"
  name                   = "wordpress"
  identifier             = "wordpress"
  username               = "master"
  password               = "korean9319"
  parameter_group_name   = "default.mysql8.0"
  availability_zone      = "ap-northeast-2a"
  db_subnet_group_name   = aws_db_subnet_group.korean_dbsg.id
  vpc_security_group_ids = [aws_security_group.korean_sg.id]
  skip_final_snapshot    = true
  tags = {
    "Name" = "korean-db"
  }
}

resource "aws_db_subnet_group" "korean_dbsg" {
  name       = "korean-dbsg"
  subnet_ids = [aws_subnet.korean_pridba.id,aws_subnet.korean_pridbc.id]
}
