terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

provider "snowflake" {
  organization_name = local.snowflake_tags.organization
  account_name      = local.snowflake_tags.account
  user              = "TERRAFORM_SVC"
  role              = "SYSADMIN"
  password          = "AuthorisedIaC@2026"
  # authenticator     = "SNOWFLAKE_JWT"
  # private_key       = var.snowflake_private_key
}

# will be used to manage Snowflake users and roles via the USERADMIN role
provider "snowflake" {
  organization_name = local.snowflake_tags.organization
  account_name      = local.snowflake_tags.account
  user              = "TERRAFORM_SVC"
  role              = "USERADMIN"
  alias             = "useradmin"
  password          = "AuthorisedIaC@2026"
  # authenticator     = "SNOWFLAKE_JWT"
  # private_key       = var.snowflake_private_key
}