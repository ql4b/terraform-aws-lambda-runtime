output "ecr" {
  description = "ECR repository details"
  value       = module.ecr
}

output "image" {
  description = "Lambda runtime image details"
  sensitive   = true
  value = {
    name     = "${module.ecr.repository_url}:${local.deploy_tag}"
    arn      = "${module.ecr.repository_arn}:${local.deploy_tag}"
    ssm_name = aws_ssm_parameter.image.name
  }
}

output "repository_url" {
  description = "ECR repository URL"
  value       = module.ecr.repository_url
}

output "repository_arn" {
  description = "ECR repository ARN"
  value       = module.ecr.repository_arn
}