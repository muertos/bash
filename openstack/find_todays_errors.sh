#!/usr/bin/env bash

for path in /var/log/kolla/*; do
    for log in $path/*; do
        echo $log
        grep -i error $log 2>/dev/null | tail -1 | grep -P '$(date-%m-%d")|$(date +"%a %b %d")'
        echo
    done
done
