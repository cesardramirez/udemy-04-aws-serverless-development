#!/bin/bash
aws cloudformation create-stack --stack-name StackIAMGrootUser --template-body file://iam-solution_2.yml --capabilities CAPABILITY_NAMED_IAM