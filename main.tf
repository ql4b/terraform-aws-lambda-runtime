module "ecr" {
  source               = "cloudposse/ecr/aws"
  version              = "0.42.1"
  
  context              = module.this.context
  attributes           = concat(["lambda-runtime"], var.attributes)
  
  image_tag_mutability = "MUTABLE"
  force_delete         = true
}

locals {
  deploy_tag = var.deploy_tag
  
  ssm_prefix = join("/", concat([
    "",
    module.this.namespace,
    module.this.name,
  ], module.this.attributes))
}