#!/bin/bash
accesslog=$1
min=$2
max=$3
export LC_ALL="en_US.UTF-8"
all=`tail -n 200000 $accesslog|grep $(date +'%d/%b/%Y:%H:%M' --date='minute ago')|wc -l`
cur=`tail -n 200000 $accesslog|grep $(date +'%d/%b/%Y:%H:%M' --date='minute ago')| awk -vmin=$min -vmax=$max '$9 > min && $9 < max{print $9}'|wc -l`
#expr $cur / $all
#echo "$cur/$all" | bc
#awk "BEGIN {print $cur/$all }"
echo "scale=2; $cur*100/$all" | bc
