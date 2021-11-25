resource "aws_internet_gateway" "korean_ig" {
  vpc_id = aws_vpc.korean_vpc.id
  
  tags={
      "Name" = "korean-ig"
  }
}