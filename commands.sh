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

# Run sh file
# bash solution_1.sh