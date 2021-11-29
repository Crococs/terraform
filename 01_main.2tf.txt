provider "aws" {
  region = var.region
}

resource "aws_key_pair" "korean-key" {
  key_name = var.key
  public_key = file("../../.ssh/korean-key.pub")
}

resource "aws_vpc" "korean_vpc" {
  cidr_block = var.cidr_main
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    "Name" = "${var.name}-vpc"
  }
}

# 가용 영역 a의 public subnet
resource "aws_subnet" "korean_pub" {
  count = length(var.pub_sub)     #2
  vpc_id            = aws_vpc.korean_vpc.id
  cidr_block        = var.pub_sub[count.index]
  availability_zone = "${var.region}${var.ava_zone[count.index]}"
  tags = {
    "Name" = "${var.name}-pub${var.ava_zone[count.index]}"
  }
}

# 가용 영역 a의 private subnet
resource "aws_subnet" "korean_pri" {
  count = 2
  vpc_id            = aws_vpc.korean_vpc.id
  cidr_block        = var.pri_sub[count.index]
  availability_zone = "${var.region}${var.ava_zone[count.index]}"
  tags = {
    "Name" = "${var.name}-pri${var.ava_zone[count.index]}"
  }
}

# 가용 영역 a의 private db
resource "aws_subnet" "korean_pridb" {
  count = 2
  vpc_id            = aws_vpc.korean_vpc.id
  cidr_block        = var.pri_subdb[count.index]
  availability_zone = "${var.region}${var.ava_zone[count.index]}"
  tags = {
    "Name" = "${var.name}-pridb${var.ava_zone[count.index]}"
  }
}
