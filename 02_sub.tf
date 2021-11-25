# 가용 영역 a의 public subnet
resource "aws_subnet" "korean_puba" {
  vpc_id = aws_vpc.korean_vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "korean-puba"
  }
}
# 가용 영역 c의 public subnet
resource "aws_subnet" "korean_pubc" {
  vpc_id = aws_vpc.korean_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "korean-pubc"
  }
}
# 가용 영역 a의 private subnet
resource "aws_subnet" "korean_pria" {
  vpc_id = aws_vpc.korean_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "korean-pria"
  }
}
# 가용 영역 c의 private subnet
resource "aws_subnet" "korean_pric" {
  vpc_id = aws_vpc.korean_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "korean-pric"
  }
}
# 가용 영역 a의 private db
resource "aws_subnet" "korean_pridba" {
  vpc_id = aws_vpc.korean_vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "korean-pridba"
  }
}
# 가용 영역 c의 private db
resource "aws_subnet" "korean_pridbc" {
  vpc_id = aws_vpc.korean_vpc.id
  cidr_block = "10.0.5.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "korean-pridbc"
  }
}