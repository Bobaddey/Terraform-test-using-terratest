package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/stretchr/testify/assert"
)

func TestTerraformAwsHelloWorldExample(t *testing.T) {
	t.Parallel()

	// Construct the terraform options with default retryable errors to handle the most common
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../",

		// Environment variables to set when running Terraform
		EnvVars: map[string]string{
			"AWS_DEFAULT_REGION": "us-east-1",
		},
		
	})

	// At the end of the test, run `terraform destroy` to clean up any resources that were created.
	defer terraform.Destroy(t, terraformOptions)

	// Run `terraform init` and `terraform apply`. Fail the test if there are any errors.
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the value of an output variable
	instanceID := terraform.Output(t, terraformOptions, "instance_id")

	// Look up the tags for the given Instance ID
	instanceTags := aws.GetTagsForEc2Instance(t, "us-east-1", instanceID)

	// Check if the EC2 instance with a given tag and name is set.
	nameTag, containsNameTag := instanceTags["Name"]
	assert.True(t, containsNameTag)
	assert.Equal(t, "Flugel", nameTag)

	// Verify that our expected name tag is one of the tags
	ownerTag, containsOwnerTag := instanceTags["Owner"]
	assert.True(t, containsOwnerTag)
	assert.Equal(t, "Flugel", ownerTag)
}