terraform {
  backend "s3" {
    bucket = "vio-ops-state"
    key    = "stage.state.tfstate"
  }
}
