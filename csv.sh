./pages.sh 50 | sort -k 2 | sed 's# | #;#g' | sed 's#&quot;#"#g' | sed "s#&\#039;#'#g"
