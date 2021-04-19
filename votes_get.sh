curl -s 'https://www.lekcjaniesmiecenia.pl/glosowanie?name=nasza' | egrep -o 'votes_qty">[0-9]+' | egrep -o '[0-9]+'
