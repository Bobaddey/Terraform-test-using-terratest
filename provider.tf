

terraform {
  required_version = ">= 0.12.20"
}


provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "vscode"
}
