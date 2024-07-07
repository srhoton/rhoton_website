terraform {
  backend "s3" {
    bucket = "b2c-tfstate"
    key    = "rhoton/website.tfstate"
    region = "us-west-2"
  }
}
