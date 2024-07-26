resource "local_file" "welcomfoo" {
  content  = "welcome to Terraform class"
  filename = "${path.module}/welcome.txt"
}