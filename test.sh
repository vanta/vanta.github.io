#!/bin/bash
taskId=`curl -s 'https://api.anti-captcha.com/createTask' \
  --data-raw '{"clientKey":"277989dcfe951b81e9a6ea408c5737f6","task":{"websiteURL":"https://www.lekcjaniesmiecenia.pl/","websiteKey":"6Lc4k3gaAAAAALGKdnOUVT5wk3t7fTPzhtYbv69y","websiteSToken":null,"recaptchaDataSValue":null,"type":"NoCaptchaTaskProxyless"},"softId":802}' \
  --compressed | jq ".taskId"`

echo "TaskId: $taskId"

echo "Waiting 60s"
sleep 60

captcha=`curl -s 'https://api.anti-captcha.com/getTaskResult' \
  --data-raw "{\"clientKey\":\"277989dcfe951b81e9a6ea408c5737f6\",\"taskId\":$taskId}" \
  --compressed | jq ".solution.gRecaptchaResponse" | ggrep -oP [a-zA-Z0-9_-]+`

echo "Captcha: $captcha"

curl -s 'https://www.lekcjaniesmiecenia.pl/glosowanie' \
    -H 'Connection: keep-alive' \
    -H 'sec-ch-ua: "Google Chrome";v="89", "Chromium";v="89", ";Not A Brand";v="99"' \
    -H 'Accept: application/json, text/plain, */*' \
    -H 'X-CSRF-TOKEN: E0Wa5W9fkccOss1GgsvGVCSeHYVPR7uRSnxXBdLp' \
    -H 'X-Requested-With: XMLHttpRequest' \
    -H 'sec-ch-ua-mobile: ?0' \
    -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36' \
    -H 'Content-Type: application/json;charset=UTF-8' \
    -H 'Origin: https://www.lekcjaniesmiecenia.pl' \
    -H 'Sec-Fetch-Site: same-origin' \
    -H 'Sec-Fetch-Mode: cors' \
    -H 'Sec-Fetch-Dest: empty' \
    -H 'Referer: https://www.lekcjaniesmiecenia.pl/glosowanie?city=&postal_code=&name=nasza' \
    -H 'Accept-Language: en-US,en;q=0.9,pl;q=0.8,pl-PL;q=0.7' \
    -H 'Cookie: XSRF-TOKEN=eyJpdiI6InFFQWErdEVpdUt3MXBnTDd2ay81dWc9PSIsInZhbHVlIjoiUlRZNXU1NkNqK2ZlSGEvRVlJTnJRVGMyWmVmazN6WDJ2N2RUTUNLV3FSZUdVUU9CaWp0cnV2aUxDTHRRbzdJeFh2dFMvQW95MzR5SVMwSms2NFJxV2g0NnBmbFBCSDZxYU9kUkttc0FVdE1GekorcUsweDZGMExWTzU5ZmdVdU0iLCJtYWMiOiI4NzcyYmEyOGIxNjJmMzUwMmExYWUxZDNiNTM2ZjJhYWE4YTZkZWIxMmIzMGYzZjhlMjU1NDcxNDA3NzMwZjI0In0%3D; lekcja_niesmiecenia_session=eyJpdiI6IjlDZG5qdzN4dHhPQUhkQ2JsN1lXVGc9PSIsInZhbHVlIjoiTHhQTlJQM2hnOVZpNTNDVE5yV3BBbFZtMkxOdDdSYVNDdTM4NzNPWUNvSVZ2L2trbkZKZVpnc29vYWFlbnNUYmkwR1V4RTZreXV2ektpTGhxbk5zeTBNdUNQdkN5MlhJWEpaTUphUnRXNm9YYlZNVnhwRmNzMXVHTWI1WTJERk8iLCJtYWMiOiJkZDAzNmE3MzZjZWE1OGFkZmI3MjNhM2Q2YmU5OTllZjgxOGNjZDRiZGM3YzNkZTdiMDVmNDBlOTQwNDY0NjUzIn0%3D' \
    --data-raw "{\"application_id\":\"333\",\"g-recaptcha-response\":\"$captcha\"}" \
    --compressed
