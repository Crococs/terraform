resource "aws_route_table" "korean_ngwrt" {
  vpc_id = aws_vpc.korean_vpc.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_nat_gateway.korean_ngw.id
  }
  tags = {
    "Name" = "korean-ngwrt"
  }
}