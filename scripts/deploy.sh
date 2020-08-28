#!/bin/bash
set -eo pipefail
PROJECT_NAME=$(cat project-name.txt)
cd src
babel . -d ../dist --ignore node_modules
cp -r ./node_modules ../dist/
cd ..
aws cloudformation package --template-file template.yml --s3-bucket $PROJECT_NAME --output-template-file out.yml
aws cloudformation deploy --template-file out.yml --stack-name $PROJECT_NAME --capabilities CAPABILITY_NAMED_IAM
rm -rf ./dist