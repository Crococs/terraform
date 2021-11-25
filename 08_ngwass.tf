resource "aws_route_table_association" "korean_ngwass_pria" {
  subnet_id = aws_subnet.korean_pria.id
  route_table_id = aws_route_table.korean_ngwrt.id
}
resource "aws_route_table_association" "korean_ngwass_pric" {
  subnet_id = aws_subnet.korean_pric.id
  route_table_id = aws_route_table.korean_ngwrt.id
}
resource "aws_route_table_association" "korean_ngwass_pridba" {
  subnet_id = aws_subnet.korean_pridba.id
  route_table_id = aws_route_table.korean_ngwrt.id
}
resource "aws_route_table_association" "korean_ngwass_pridbc" {
  subnet_id = aws_subnet.korean_pridbc.id
  route_table_id = aws_route_table.korean_ngwrt.id
}