#!/bin/bash

taskId=$1

CAPTCHA_KEY='6Lc4k3gaAAAAALGKdnOUVT5wk3t7fTPzhtYbv69y'
ANTICAPTCHA_CLIENT_KEY='277989dcfe951b81e9a6ea408c5737f6'

response=`./recaptcha_get.sh $taskId`

status=`echo $response | jq ".status" | ggrep -oP [a-z]+`
errorId=`echo $response | jq ".errorId"`

while [ "$status" = "processing" ] && [ "$errorId" -eq 0 ]
do
  #echo "No result yet, waiting 10s..."
  say "waiting"
  sleep 5

  response=`./recaptcha_get.sh $taskId`

  status=`echo $response | jq ".status" | ggrep -oP [a-z]+`
  errorId=`echo $response | jq ".errorId"`
done

echo $response | jq ".solution.gRecaptchaResponse" | ggrep -oP "[a-zA-Z0-9_-]+"
