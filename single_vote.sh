#!/bin/bash

token=$1
captcha=$2

curl -s --cookie 'nds.cookie' 'https://www.lekcjaniesmiecenia.pl/glosowanie' \
    -H 'Connection: keep-alive' \
    -H 'sec-ch-ua: "Google Chrome";v="89", "Chromium";v="89", ";Not A Brand";v="99"' \
    -H 'Accept: application/json, text/plain, */*' \
    -H "X-CSRF-TOKEN: $token" \
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
    --data-raw "{\"application_id\":\"333\",\"g-recaptcha-response\":\"$captcha\"}" \
    --compressed
