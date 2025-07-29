variable "deploy_tag" {
  type        = string
  description = "Docker image tag for deployment"
  default     = "latest"
}

variable "attributes" {
  type        = list(string)
  description = "Additional attributes for naming (e.g., ['bash', 'golang'])"
  default     = []
}