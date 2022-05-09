provider "random" {
  version = ">= 2.0"
}

provider "local" {
  version = ">= 2.0"
}

# London
provider "aws" {
  region  = var.aws_region
  version = "~> 3.0"
  shared_credentials_file = "~/Repos/.aws/credentials"
  profile = "sporticia"
  assume_role {
    role_arn     = "arn:aws:iam::137502009769:role/tfadmin"
  }
}
