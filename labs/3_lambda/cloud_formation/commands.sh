# Run each command in the project root (file:// without errors)
#!/bin/bash
aws cloudformation create-stack \
  --stack-name StackBucketS3 \
  --template-body file://labs/3_lambda/cloud_formation/s3.yml

aws s3 cp labs/3_lambda/cli/code.zip s3://cesardramirez-course-us-east-1/function.zip

aws cloudformation create-stack \
  --stack-name StackMyFirstLambda \
  --template-body file://labs/3_lambda/cloud_formation/lambda.yml \
  --capabilities CAPABILITY_NAMED_IAM CAPABILITY_IAM