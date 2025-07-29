# terraform-aws-lambda-runtime

> ECR repository and SSM parameters for custom Lambda runtimes

Terraform module that provisions ECR repository and SSM parameters needed for custom Lambda runtime deployment. Simplifies sharing runtime references between infrastructure and serverless projects.

## Features

- **ECR Repository** with mutable tags for runtime images
- **SSM Parameter** for image reference sharing
- **CloudPosse labeling** for consistent naming
- **Flexible attributes** for multi-runtime support

## Usage

```hcl
module "bash_runtime" {
  source = "git::https://github.com/ql4b/terraform-aws-lambda-runtime.git"
  
  attributes = ["bash"]
  deploy_tag = "v1.0.0"
  
  context = module.label.context
}

module "golang_runtime" {
  source = "git::https://github.com/ql4b/terraform-aws-lambda-runtime.git"
  
  attributes = ["golang"]
  
  context = module.label.context
}
```

## Outputs

- `repository_url` - ECR repository URL for docker push
- `image.name` - Full image name with tag
- `image.ssm_name` - SSM parameter name for serverless reference

## Integration with Serverless

```bash
# Get image from SSM for serverless deployment
aws ssm get-parameter --name $(terraform output -raw image.ssm_name) --query 'Parameter.Value'
```