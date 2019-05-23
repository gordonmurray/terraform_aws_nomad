provider "aws" {
  region                  = "${var.region}"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
}


terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "gordon"

    workspaces {
      name = "terraform_aws_nomad"
    }
  }
}
