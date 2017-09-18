cat $1 | grep -i "nicolas bomber" | awk -F'\t' '{print$3}' | awk -F'[^0-9]*' '$1'
