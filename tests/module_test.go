package tests

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"

	"github.com/stretchr/testify/require"
)

type Fields struct {
	BucketID  string
	KMSKeyID  string
	KMSKeyARN string
}

type moduleTestCase struct {
	TestName   string
	ModuleName string
	Expected   Fields
}

func TestModule_Simple(t *testing.T) {
	t.Parallel()

	tc := &moduleTestCase{
		TestName:   "simpletest",
		ModuleName: "s3bucket",
		Expected: Fields{
			BucketID: "s3bucket",
		},
	}

	runModuleTest(t, tc)
}

func runModuleTest(t *testing.T, tc *moduleTestCase) {
	testFolder := "../"

	options := &terraform.Options{
		TerraformDir: testFolder,
	}

	defer terraform.Destroy(t, options)
	_, errinit := terraform.InitAndApplyE(t, options)
	require.Nil(t, errinit)

	actual := Fields{
		BucketID: terraform.Output(t, options, "s3_bucket_id"),
		KMSKeyID: terraform.Output(t, options, "kms_key_id"),
	}

	verifyFields(t, tc.Expected, actual)
}

func verifyFields(t *testing.T, expected Fields, actual Fields) {
	t.Helper()
	require.Equal(t, expected.BucketID, actual.BucketID, "BucketIDs are not equal")
	require.NotNil(t, actual.KMSKeyID)
}
