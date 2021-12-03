terraform {
  backend "s3" {
    bucket = "vio-ops-state"
    key    = "dev.state.tfstate"
    region = var.aws_region
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
  }
}
