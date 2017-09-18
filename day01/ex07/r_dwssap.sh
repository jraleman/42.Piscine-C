#!/bin/bash
cat /etc/passwd | sed -e 's/#.*//' -e 's/[ ^I]*$//' -e '/^$/ d' -e 's/:.*//g' \
| tr '\n' ',' | rev | tr "," "\n" | sort -r | tr "\n" ","  \
| sed -e 's/, */, /g' -e 's/.$//' -e 's/.\{3\}$//'
