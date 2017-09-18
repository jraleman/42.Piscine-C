ldapsearch 'cn=*bon*' cn | grep -v '#\|dn\|search\|result\|^[[:space:]]*$' | wc -l | sed 's/ //g'
