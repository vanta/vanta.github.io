#!/bin/bash

taskId=$1

CAPTCHA_KEY='6Lc4k3gaAAAAALGKdnOUVT5wk3t7fTPzhtYbv69y'
ANTICAPTCHA_CLIENT_KEY='277989dcfe951b81e9a6ea408c5737f6'

response=`curl -s -H "Accept: application/json" \
     -H "Content-Type: application/json" \
     -X POST \
     -d "{
          \"clientKey\":\"$ANTICAPTCHA_CLIENT_KEY\",
          \"taskId\":$taskId
        }" \
    https://api.anti-captcha.com/getTaskResult`

echo $response
