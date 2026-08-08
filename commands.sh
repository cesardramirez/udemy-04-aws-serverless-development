#!/bin/bash

# User Creation
aws iam create-user --user-name cramirezd
aws iam create-user --user-name mnaranjos
aws iam create-user --user-name pguerrerol

# View user list
aws iam list-users

# Export user list to JSON file
aws iam list-users --output json > ~/Documents/users.json

# Associate Policy
aws iam attach-user-policy --user-name cramirezd --policy-arn arn:aws:iam::aws:policy/AdministratorAccess

# Verify a user's policies
aws iam list-attached-user-policies --user-name cramirezd

# Delete a user
aws iam delete-user --user-name pguerrerol

# Unlink a policy from a user
iam detach-user-policy --user-name pguerrerol --policy-arn arn:aws:iam::aws:policy/AmazonMemoryDBReadOnlyAccess

# List all managed policies
aws iam list-policies

# List all policies created by you in the account
aws iam list-policies --scope Local

# Lists all policies associated with a user
aws iam list-attached-user-policies --user-name cramirezd

# Lists all policies associated with a group
aws iam list-attached-group-policies --group-name vengadores

# Inline Policy 
aws iam list-group-policies --group-name vengadores

# View the content of an inline policy
aws iam get-group-policy --group-name vengadores --policy-name S3ListBucketsOnly

# Enables console access for a user
aws iam create-login-profile --user-name cramirezd --password '<value>' --password-reset-required

# Verify if the user has access to the console
aws iam get-login-profile --user-name cramirezd

# Disable console access for a user
aws iam delete-login-profile --user-name cramirezd

# Get the current user's data
aws iam get-user --user-name groot

# Get the group by its name
aws iam get-group --group-name vengadores

# Get the role by its name
aws iam get-role --role-name lambda-rol-with-cli

# List of all stacks
aws cloudformation list-stacks

# Create an IAM stack using a JSON file
aws cloudformation create-stack --stack-name StackIAMUsuarioJSON --template-body file://iam-basic-user.json --capabilities CAPABILITY_NAMED_IAM

# Create an IAM stack using a YAML file
aws cloudformation create-stack --stack-name StackIAMUsuarioYAML --template-body file://iam-basic-user.yml --capabilities CAPABILITY_NAMED_IAM

# Update an existing IAM stack using a YAML file
aws cloudformation update-stack --stack-name StackIAMUsuarioYAML --template-body file://iam-basic-user.yml --capabilities CAPABILITY_NAMED_IAM

# Create an S3 stack using a YAML file
aws cloudformation create-stack --stack-name StackBucketS3 --template-body file://s3.yml

# Create an Lambda stack with a Role using a YAML file
aws cloudformation create-stack --stack-name StackMyFirstLambda --template-body file://lambda.yml --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM

# Remove an IAM stack
aws cloudformation delete-stack --stack-name StackIAMGrootUser

# Get an IAM stack
aws cloudformation describe-stacks --stack-name StackIAMGrootUser
aws cloudformation describe-stacks --stack-name StackBucketS3

# Create a role for a lambda function
aws iam create-role \
  --role-name lambda-rol-with-cli \
  --assume-role-policy-document file://labs/3_lambda/trust-policy.json

# Create lambda function
aws lambda create-function \
  --function-name my-first-function-python-with-cli \
  --runtime python3.15 \
  --handler code.lambda_handler \
  --zip-file fileb://labs/3_lambda/code.zip \
  --role arn:aws:iam::583594224103:role/lambda-rol-with-cli

# Remove a lambda function
aws lambda delete-function \
  --function-name my-first-function-python-with-cli

# Check the configuration of an AWS Lambda Function URL
aws lambda get-function-url-config --function-name my-first-function-python-html

# Copy a file from one directory to another
aws s3 cp labs/3_lambda/cli/code.zip s3://cesardramirez-course-us-east-1/function.zip

# Run sh file
# bash solution_1.sh