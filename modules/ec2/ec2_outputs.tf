# Output for Public EC2 Instances
output "instance_ips" {
  description = "Instance IPs"
  value = {
    for i in aws_instance.ec2_instance :
    i.id => {
      name       = i.tags["Name"]
      private_ip = i.private_ip
    }
  }
}
output "instance_ids" {
  value = aws_instance.ec2_instance[*].id
}