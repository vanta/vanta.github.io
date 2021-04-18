#!/bin/bash

CAPTCHA_KEY='6Lc4k3gaAAAAALGKdnOUVT5wk3t7fTPzhtYbv69y'
ANTICAPTCHA_CLIENT_KEY='277989dcfe951b81e9a6ea408c5737f6'

response=`curl -s -H "Accept: application/json" \
     -H "Content-Type: application/json" \
     -X POST \
     -d "{
         \"clientKey\":\"$ANTICAPTCHA_CLIENT_KEY\",
         \"task\":
             {
                 \"type\":\"NoCaptchaTaskProxyless\",
                 \"websiteURL\":\"https://www.lekcjaniesmiecenia.pl/\",
                 \"websiteKey\":\"$CAPTCHA_KEY\"
             },
         \"softId\":802
        }" \
     https://api.anti-captcha.com/createTask`

taskId=`echo $response | jq ".taskId"`

echo "$taskId"
