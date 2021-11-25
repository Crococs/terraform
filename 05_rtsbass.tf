resource "aws_route_table_association" "korean_rtsbass_puba" {
  subnet_id      = aws_subnet.korean_puba.id
  route_table_id = aws_route_table.korean_rt.id
}
resource "aws_route_table_association" "korean_rtsbass_pubc" {
  subnet_id      = aws_subnet.korean_pubc.id
  route_table_id = aws_route_table.korean_rt.id
}
