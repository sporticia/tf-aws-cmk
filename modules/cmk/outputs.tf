output "key_id" {
  description = "KMS key id."
  value       = concat(aws_kms_key.this[*].key_id, [""])[0]
}

output "arn" {
  description = "KMS key arn."
  value       = concat(aws_kms_key.this[*].arn, [""])[0]
}

output "alias_arn" {
  description = "KMS key alias arn."
  value       = concat(aws_kms_alias.this[*].arn, [""])[0]
}
