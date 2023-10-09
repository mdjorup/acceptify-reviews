#!/bin/bash

# Activate virtual environment
source venv/bin/activate

# Install dependencies to package directory
pip install -r requirements.txt -t ./package

# Copy src files to the package directory
cp -r src/* package/

# Create a deployment package
cd package
zip -r ../lambda_function.zip .
cd ..

# Deploy the Lambda function
aws lambda update-function-code \
    --function-name MySQSFunction \
    --zip-file fileb://lambda_function.zip
