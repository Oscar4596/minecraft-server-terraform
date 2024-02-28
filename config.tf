terraform {
  required_version = "1.7.4"
  backend "s3" {
    bucket = "osloor-terraform-states"
    key    = "minecraft-server"
    region = "us-east-1"
  }

}

provider "aws" {
  region = "us-east-1"
}
