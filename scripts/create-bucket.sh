#!/bin/bash
PROJECT_NAME=$(cat project-name.txt)
aws s3 mb s3://$PROJECT_NAME
