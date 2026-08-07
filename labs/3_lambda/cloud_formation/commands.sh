# Run each command in the project root (file:// without errors)
#!/bin/bash
aws cloudformation create-stack \
  --stack-name StackBucketS3 \
  --template-body file://labs/3_lambda/cloud_formation/s3.yml
aws cloudformation create-stack \
  --stack-name StackMyFirstLambda \
  --template-body file://labs/3_lambda/cloud_formation/lambda.yml \
  --capabilities CAPABILITY_NAMED_IAM CAPABILITY_IAM