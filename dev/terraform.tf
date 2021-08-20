terraform {
  backend "s3" {
    bucket = "vio-ops"
    key    = "dev.state.tfstate"
  }
}
