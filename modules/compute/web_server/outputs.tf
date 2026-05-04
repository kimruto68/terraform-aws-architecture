output "website_url" {
  value = "http://${aws_instance.dockerhost.public_ip}"
}