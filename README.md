# Terraform AWS EC2 & S3 Deployment with IAC Testing using Terratest, and Github Actions for Code Validation

This folder contains a simple Terraform module that deploys resources in [AWS](https://aws.amazon.com/) to demonstrate
how you can use Terratest to write automated tests for your AWS Terraform code. This module deploys an [S3
Bucket](https://aws.amazon.com/s3/) - and an EC2 Instance. This module gives both Bucket and Instance a `Name` & `Owner` tag with the value 
specified as `Flugel` and `InfraTeam`, respectively. This module also contains a terraform variable 
that will create a basic bucket policy that will restrict the "origin" bucket to only accept SSL connections.

Note that the S3 Buckets in this module will not contain any actual objects/files after creation; they will only contain a 
versioning and logging configuration, as well as tags. 

**WARNING**: This module and the automated tests for it deploy real resources into your AWS account which can cost you
money. The resources are all part of the [AWS Free Tier](https://aws.amazon.com/free/), so if you haven't used that up,
it should be free, but you are completely responsible for all AWS charges.




## Running this module manually

1. Sign up for [AWS](https://aws.amazon.com/).
1. Configure your AWS credentials using one of the [supported methods for AWS CLI
   tools](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html), such as setting the
   `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` environment variables. If you're using the `~/.aws/config` file for profiles then export `AWS_SDK_LOAD_CONFIG` as "True".
1. Set the AWS region you want to use as the environment variable `AWS_DEFAULT_REGION`.
1. Install [Terraform](https://www.terraform.io/) and make sure it's on your `PATH`.
1. Run `terraform init`.
1. Run `terraform apply`.
1. When you're done, run `terraform destroy`.




## Running automated tests against this module

1. Sign up for [AWS](https://aws.amazon.com/).
1. Configure your AWS credentials using one of the [supported methods for AWS CLI
   tools](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html), such as setting the
   `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` environment variables. If you're using the `~/.aws/config` file for profiles then export `AWS_SDK_LOAD_CONFIG` as "True".
1. Install [Terraform](https://www.terraform.io/) and make sure it's on your `PATH`.
1. Install [Golang](https://golang.org/) and make sure this code is checked out into your `GOPATH`.
1. `cd test`
1. `go mod init github.com/bobaddey/Terraform-test-using-terratest .`
1. `go mod tidy`
1. `go test -v -run TestTerraformAwsS3Example`
1. `go test -v -run estTerraformAwsHelloWorldExample`T
