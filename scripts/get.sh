#!/bin/bash
set -eo pipefail
PROJECT_NAME=$(cat project-name.txt)
APIID=$(aws cloudformation describe-stack-resource --stack-name $PROJECT_NAME --logical-resource-id api --query 'StackResourceDetail.PhysicalResourceId' --output text)
REGION=$(aws configure get region)
echo $https://$APIID.execute-api.$REGION.amazonaws.com/api/
curl https://$APIID.execute-api.$REGION.amazonaws.com/api/ -v