# Output Settings => apply 완료 후 프롬프트에 주요 정보(Elastic IP, Instance id) 출력.
output "web_instance_eip" {
    value = aws_eip.web_eip.public_ip
}

output "was_instance_private_ip" {
    value = aws_instance.Was_Server.private_ip
}

output "web_instance_id" {
    value = aws_instance.Web_server.id
}

output "was_instance_id" {
    value = aws_instance.Was_Server.id
}