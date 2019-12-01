#!/bin/bash

DOMAIN="gobuild.today"

aws s3 mb "s3://$DOMAIN" \
    --region us-east-1

aws s3 mb "s3://www.$DOMAIN" \
    --region us-east-1

aws s3api put-bucket-policy \
    --bucket "$DOMAIN" \
    --policy "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Sid\":\"PublicReadGetObject\",\"Effect\":\"Allow\",\"Principal\":\"*\",\"Action\":[\"s3:GetObject\"],\"Resource\":[\"arn:aws:s3:::$DOMAIN/*\"]}]}"

aws s3api put-bucket-website \
    --bucket "$DOMAIN" \
    --website-configuration '{"IndexDocument":{"Suffix":"index.html"},"ErrorDocument":{"Key":"error.html"}}'

#aws route53 list-hosted-zones
#aws route53 change-resource-record-sets --hosted-zone-id ZXXXXXXXXXX --change-batch file://record-set.json