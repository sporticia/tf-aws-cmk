locals {
  account_id = data.aws_caller_identity.current.account_id
  admin_username = "scott"
  alias          = "alias/${var.alias}"
  ## Passing an empty policy to CMK will lock the key, which can be resolved only by contacting AWS Support
  ## This check is very simple and just to make sure no one is passing empty values or generally incorrect json
  ## lenght to ensure at least this is passed as json: "Statement":[{"Effect": "Allow","Principal"
  policy_validation = var.policy == null ? "" : length(replace(jsonencode(jsondecode(var.policy)), " ", "")) > 44 ? "" : lookup({ k = "v" }, format("[INPUT ERROR]: Invalid policy"))
}

data "aws_caller_identity" "current" {}

# Creates/manages KMS CMK
resource "aws_kms_key" "this" {
  description              = var.description
  is_enabled               = var.key_enabled
  enable_key_rotation      = var.rotation_enabled
  tags                     = var.tags
  policy                   = var.policy == null ? concat(data.aws_iam_policy_document.this[*].json, [""])[0] : var.policy
  deletion_window_in_days  = 30
}

# Add an alias to the key
resource "aws_kms_alias" "this" {
  name          = local.alias
  target_key_id = aws_kms_key.this.key_id
}
