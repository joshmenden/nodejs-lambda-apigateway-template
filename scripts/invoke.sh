#!/bin/bash
set -eo pipefail
PROJECT_NAME=$(cat project-name.txt)
FUNCTION=$(aws cloudformation describe-stack-resource --stack-name $PROJECT_NAME --logical-resource-id function --query 'StackResourceDetail.PhysicalResourceId' --output text)

while true; do
  aws lambda invoke --function-name $FUNCTION --payload file://tests/event.json out.json
  cat out.json
  echo ""
  sleep 2
done
