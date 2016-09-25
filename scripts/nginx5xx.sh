#!/bin/bash
accesslog=$1
# grep $(date +'%d/%b/%Y:%H:%M' --date='minute ago')
export LC_ALL="en_US.UTF-8";tail -n 200000 $accesslog| grep $(date +'%d/%b/%Y:%H:%M' --date='minute ago') | grep -v " 301 " | grep -v " 200 " |grep -v " 204 " | grep -v " 404 " |grep -Ec " 5[0-9][0-9] "
