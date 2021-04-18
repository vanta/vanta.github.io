curl -s "https://www.lekcjaniesmiecenia.pl/glosowanie?page=$1" |
  tr '\n' ' ' |
  sed $'s#<form#\\\n<form#g' |
  egrep -o "votes_qty.+flex items-center" |
  sed 's/<[^>]*>//g' |
  sed 's#  *# #g' |
  sed 's#.*>##' |
  sed 's# <.*##' |
  sed 's# głosów # | #'
