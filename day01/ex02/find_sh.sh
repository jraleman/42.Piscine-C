#!/bin/bash
ext=sh
find . -name "*.$ext" | ls -ARFp1 | grep -v '/' | sed 's/\.'$ext'[^\.]*$//' \
| grep -v '^$'
