resource "aws_eip" "korean_ngw_ip" {
  vpc = true
}
resource "aws_nat_gateway" "korean_ngw" {
  allocation_id = aws_eip.korean_ngw_ip.id
  subnet_id = aws_subnet.korean_puba.id
  tags = {
    "Name" = "korean-ngw"
  }
}