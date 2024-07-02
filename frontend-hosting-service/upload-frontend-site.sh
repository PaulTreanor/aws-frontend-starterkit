#!/bin/bash
export AWS_REGION=eu-west-1
export AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query 'Account' --output text)
export S3_BUCKET_NAME="frontend-hosting-service-${AWS_ACCOUNT_ID}-${AWS_REGION}"

echo "AWS Account ID: ${AWS_ACCOUNT_ID}"
echo "AWS Region: ${AWS_REGION}"
echo "S3 Bucket Name: ${S3_BUCKET_NAME}"

# Upload static frontend build files to S3 bucket.
# We are using cp instead of sync because we want to keep the contents of the archive
# folder in the bucket. This archive folder (for rollbacks) hasn't been made yet. 
aws s3 cp ../frontend-app/dist s3://${S3_BUCKET_NAME} --recursive
http://frontend-hosting-service-659430677818-eu-west-1.s3-eu-west-1.amazonaws.com/
echo "Site available at:"
echo "http://${S3_BUCKET_NAME}.s3-${AWS_REGION}.amazonaws.com"