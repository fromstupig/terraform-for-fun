terraform {
  backend "s3" {
    bucket = "vio-ops-state"
    key    = "dev.state.tfstate"
  }
}
