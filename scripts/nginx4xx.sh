#!/bin/bash
accesslog=$1
# grep $(date +'%d/%b/%Y:%H:%M' --date='minute ago')
export LC_ALL="en_US.UTF-8";tail -n 200000 $accesslog| grep $(date +'%d/%b/%Y:%H:%M' --date='minute ago') | grep -Ec " 4[0-9][0-9] "
