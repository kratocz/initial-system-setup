#!/bin/sh
FREE=`/bin/df -m --output=avail $1 | /usr/bin/tail -n 1`
/usr/bin/test $FREE -gt $2

