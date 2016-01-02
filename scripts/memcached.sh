#!/bin/bash

if [ -z $1 ]
  then
    echo 0;
    exit 1;
  else
    METRIC=$1
fi
if [ -z $2 ]
  then
    HOSTNAME="localhost"
  else
    HOSTNAME="${2}"
fi

if [ -z $3 ]
  then
    PORT="11211"
  else
    PORT="${3}"
fi

/bin/echo -e "stats\nquit" | /bin/nc -w2 -q2 $HOSTNAME $PORT | /bin/grep "STAT $1 " | /usr/bin/awk '{print $3}'
