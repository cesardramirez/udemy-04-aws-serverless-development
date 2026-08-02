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

# Enables console access for a user
aws iam create-login-profile --user-name cramirezd --password '<value>' --password-reset-required

# Verify if the user has access to the console
aws iam get-login-profile --user-name cramirezd

# Disable console access for a user
aws iam delete-login-profile --user-name cramirezd

# List of all stacks
aws cloudformation list-stacks

# Create a stack using a JSON file
aws cloudformation create-stack --stack-name StackIAMUsuarioJSON --template-body file://iam-basic-user.json --capabilities CAPABILITY_NAMED_IAM

# Create a stack using a YAML file
aws cloudformation create-stack --stack-name StackIAMUsuarioYAML --template-body file://iam-basic-user.yml --capabilities CAPABILITY_NAMED_IAM

# Get the current user's data
aws iam get-user

# Run sh file
# bash solution_1.sh