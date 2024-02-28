output "pub_ip" {
  value       = aws_instance.minecraft_server.public_ip
  description = "Instance Public IP"
  depends_on  = [aws_instance.minecraft_server]
}
