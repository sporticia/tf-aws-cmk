locals {
  ebs-volumes-key                = module.kms_ebs_volume.arn
}

# default eu-west-2 London
resource "aws_ebs_default_kms_key" "default" {
  key_arn = local.ebs-volumes-key
}

resource "aws_ebs_encryption_by_default" "default" {
  enabled = true
}
