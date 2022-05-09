locals {
  admin_username = "scott"
  account_id     = data.aws_caller_identity.current.account_id
  name = "cmk-ebs-${random_string.key_name.result}"
}

data "aws_caller_identity" "current" {}

resource "random_string" "key_name" {
  length  = 6
  lower   = true
  upper   = false
  special = false
}

# deafult eu-west-2 London
module "kms_ebs_volume" {
  source = "git@github.com:sporticia/tf-aws-cmk//modules/cmk/tags?ref=v0.1.0"
  
  providers = {
    aws = aws
  }
  
  enabled     = true
  description = "cmk ebs test"
  alias       = local.name
  
  tags = {
    Name = "cmk ebs test"
  }
}
