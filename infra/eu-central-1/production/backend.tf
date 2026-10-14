terraform {
  backend "s3" {
    bucket = "dubem-achs-tfstate-bucket"
    key    = "production/forge/terraform.tfstate"
    region = "eu-central-1"
  }
}
