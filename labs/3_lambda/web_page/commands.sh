# Run each command in the project root (file:// without errors)
#!/bin/bash
aws s3 cp labs/3_lambda/web_page/function-html.zip s3://cesardramirez-course-us-east-1/web_page/

aws cloudformation create-stack \
  --stack-name StackHtmlLambda \
  --template-body file://labs/3_lambda/web_page/html.yml \
  --capabilities CAPABILITY_NAMED_IAM CAPABILITY_IAM