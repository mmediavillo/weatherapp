output "container-name" {
  value       = module.container[*].container-name
  description = "Name of the container"
}

output "IP-Address" {
  value       = flatten(module.container[*].IP-Address)
  description = "The IP address of the container"
}