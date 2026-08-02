#!/bin/bash
# aws cloudformation create-stack --stack-name StackIAMUsuarioJSON --template-body file://iam-basic-user.json
# aws: [ERROR]: An error occurred (InsufficientCapabilitiesException) when calling the CreateStack operation: Requires capabilities : [CAPABILITY_NAMED_IAM]
aws cloudformation create-stack --stack-name StackIAMUsuarioJSON --template-body file://iam-basic-user.json --capabilities CAPABILITY_NAMED_IAM
aws cloudformation create-stack --stack-name StackIAMUsuarioYAML --template-body file://iam-basic-user.yml --capabilities CAPABILITY_NAMED_IAM