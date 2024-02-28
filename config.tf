terraform {
  required_version = "1.7.4"
  backend "remote" {
    # The name of your Terraform Cloud organization.
    organization = "Kroz"

    # The name of the Terraform Cloud workspace to store Terraform state files in.
   /*  workspaces {
      name = "minecraft-server-terraform"
    } */
  }
}

provider "aws" {
  region = "us-east-1"
}
