resource "aws_key_pair" "korean-key" {
  key_name = "korean1-key"
  public_key = file("../../.ssh/korean-key.pub")
  #public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC+vrB2r/F77aHhrDKVYzxCWY63236BB9d8psQeYDcoIoAbej/vWXd9QJ6zeie2Pu3U0MPkdy4Fuwgu+V0Bv1nK7hR1K0kpI7QF+YNKRU7b505eYSGh8RyCMFGRaqUwkqGQ4KV+/kiX+Dv5Rqm5u1Qmx+cjI3QfYhNPhl7DEnE0lu7tGFYbmVsrzVBC6GlopySFIc8FvUOu719XQMeivYxqA0nLP30EEqYItBFR/qKDSZDYS4kWYiaaNeGofNSjLHeL/vZrgvxK4uoBOkixOviACjgi27n7owAKTgp3+zm3VU0zHIFKro68F0W+fKxDwpB8aCECqfcZO8VG3XivmCGeRFK1+wnmwHudh4Gk1jW10eoB6m3g4en++0ipPohLUUiv3411AyEb9BG1EzTHS8Ch3L+wJLF4ze3J1QEzQk0cwoSuASXL/MiUaDGP+oC7OXm8TluNYWdEDEsbGYjbhlZhVDSgloImoyVUWBwKs6e78xr0tei/ENgusudPWdD3Gu8="

}