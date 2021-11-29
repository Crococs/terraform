resource "aws_internet_gateway" "korean_ig" {
  vpc_id = aws_vpc.korean_vpc.id
  
  tags={
      "Name" = "${var.name}-ig"
  }
}

resource "aws_route_table" "korean_rt" {
  vpc_id = aws_vpc.korean_vpc.id

  route{
      cidr_block = var.cidr_route
      gateway_id = aws_internet_gateway.korean_ig.id
  }
  tags = {
    "Name" = "korean-rt"
  }
}

resource "aws_route_table_association" "korean_igas_pub" {
  count = 2
  subnet_id      = aws_subnet.korean_pub[count.index].id
  route_table_id = aws_route_table.korean_rt.id
}
