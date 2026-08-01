#!/bin/bash

# Create 3 users
aws iam create-user --user-name dramosr
aws iam create-user --user-name mnaranjos
aws iam create-user --user-name pguerrerol

# Assign read-only policy
aws iam attach-user-policy --user-name dramosr --policy-arn arn:aws:iam::aws:policy/AmazonDynamoDBReadOnlyAccess
aws iam attach-user-policy --user-name mnaranjos --policy-arn arn:aws:iam::aws:policy/IAMReadOnlyAccess
aws iam attach-user-policy --user-name pguerrerol --policy-arn arn:aws:iam::aws:policy/AmazonMemoryDBReadOnlyAccess