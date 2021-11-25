resource "aws_key_pair" "korean-key" {
  key_name = "korean1-key"
  public_key = file("../../.ssh/korean-key.pub")
}