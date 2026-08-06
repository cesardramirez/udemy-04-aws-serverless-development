# Run each command in the project root (file:// without errors)
aws iam create-role \
  --role-name lambda-rol-with-cli \
  --assume-role-policy-document file://labs/3_lambda/trust-policy.json
aws lambda create-function \
  --function-name my-first-function-python-with-cli \
  --runtime python3.15 \
  --handler code.lambda_handler \
  --zip-file fileb://labs/3_lambda/code.zip \
  --role arn:aws:iam::583594224103:role/lambda-rol-with-cli
aws lambda delete-function \
  --function-name my-first-function-python-with-cli