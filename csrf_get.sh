#!/bin/bash
response=`curl -s --cookie-jar 'nds.cookie' 'https://www.lekcjaniesmiecenia.pl/glosowanie?name=nasza'`

echo $response | ggrep -oP '"csrf-token" content="[a-zA-Z0-9]+"' | ggrep -o -P '[a-zA-Z0-9]{20,}'
