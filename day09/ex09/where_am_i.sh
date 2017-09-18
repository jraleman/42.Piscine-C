#!/bin/bash

ip_list=$(ifconfig | grep "inet " | cut -d' ' -f2)

if (test -z "$ip_list")
  then
    echo "Je suis perdu!"
  else
    echo $ip_list | (tr ' ' '\n')
fi
