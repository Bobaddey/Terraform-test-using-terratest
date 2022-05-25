#Output the instance's public ip address

output "public_ip" {
  value       = aws_instance.Test_instance.public_ip
  description = "Public IP Address of the Instance "
}

output "tags"{
    value = aws_instance.Test_instance.tags
      description = "Tags"

}

output "instance_id"{
    value = aws_instance.Test_instance.id
      description = "The ID of the instance "

}