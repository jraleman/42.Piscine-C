#!/bin/bash
groups $FT_USER | tr " " "," | tr -d "\n"
