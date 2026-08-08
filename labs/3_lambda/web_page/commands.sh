# Run each command in the project root (file:// without errors)
#!/bin/bash
aws s3 cp labs/3_lambda/web_page/function-html.zip s3://cesardramirez-course-us-east-1/web_page/

aws cloudformation create-stack \
  --stack-name StackHtmlLambda \
  --template-body file://labs/3_lambda/web_page/html.yml \
  --capabilities CAPABILITY_NAMED_IAM CAPABILITY_IAM

aws cloudformation update-stack \
  --stack-name StackHtmlLambda \
  --template-body file://labs/3_lambda/web_page/html.yml \
  --capabilities CAPABILITY_NAMED_IAM CAPABILITY_IAM

aws cloudformation create-stack \
  --stack-name StackHtmlProtectedLambda \
  --template-body file://labs/3_lambda/web_page/html.yml \
  --capabilities CAPABILITY_NAMED_IAM

# Runing awscurl in a Python virtual environment
source .venv/bin/activate
python3 -m pip install awscurl
# Each time a stack is deployed, the URL changes.
awscurl --service lambda \
  --region us-east-1 \
  -X GET https://bn2b7gxo46mnqmaqekist4rjym0tlkeb.lambda-url.us-east-1.on.aws/
