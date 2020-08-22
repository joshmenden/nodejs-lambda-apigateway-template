#!/bin/bash
set -eo pipefail
PROJECT_NAME=$(cat project-name.txt)
aws cloudformation package --template-file template.yml --s3-bucket $PROJECT_NAME --output-template-file out.yml
aws cloudformation deploy --template-file out.yml --stack-name $PROJECT_NAME --capabilities CAPABILITY_NAMED_IAM
