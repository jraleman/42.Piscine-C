ldapsearch "uid=z*" cn | sort -r | grep -v '#\|dn\|search\|result\|^[[:space:]]*$'
