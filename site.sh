echo "<html><head><style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
th, td {
  padding: 3px;
}
</style></head><body>"
echo "<h1>Wyniki głosowania ("`date`"):</h1>"
echo "<table border=1>"

echo "<tr><th>Miejsce</th><th>Głosów</th><th>Nazwa</th></tr>"

counter=1

while read data; do
  votes=`echo $data | egrep -o "^[0-9]+"`
  name=`echo $data | egrep -o "[^|]+$" | xargs`

  color='FFFFFF'

  if [[ $name =~ "Nasza Dobra Szkoła" ]] ; then
    color='cc3366'
  else
    if [ $counter -lt 11 ] ; then
      color='66cc66'
    fi
  fi

  echo "<tr style='background-color:#$color'><td style="text-align:right">$counter</td><td style="text-align:right">$votes</td><td>$name</td></tr>"

  ((counter+=1))
done

echo "</table>"
echo "</body></html>"
