output "kms_key_id" {
  description = "KMS Key id."
  value       = module.kms_ebs_volume.key_id
}

output "kms_key_arn" {
  description = "KMS Key arn."
  value       = module.kms_ebs_volume.arn
}

output "kms_key_alias_arn" {
  description = "KMS Key alias."
  value       = module.kms_ebs_volume.alias_arn
}