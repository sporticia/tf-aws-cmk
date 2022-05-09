variable "aws_region" {
  description = "AWS Region to deploy resources."
  type        = string
  default     = "eu-west-2"
}

variable "description" {
  description = "Description for the KMS key"
  type        = string
  default     = "KMS key"
}

variable alias {
  description = "KMS key alias name."
  type        = string
  default     = ""
}

variable "enabled" {
  description = "Allow to enable/disable resources creation."
  type        = bool
  default     = true
}

variable "key_enabled" {
  description = "Enable/disable key"
  type        = bool
  default     = true
}

variable "key_usage" {
  description = "Specifies the intended use of the key."
  type        = string
  default     = "ENCRYPT_DECRYPT"
}

variable "rotation_enabled" {
  default = true
}

variable "policy" {
  description = "KMS key access policy. Providing empty string policy will result in locking the key."
  type        = string
  default     = null
}

variable "tags" {
  description  = "Tags"
  type        = string
  default     = null
}
