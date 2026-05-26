#!/bin/bash

clock() {
    rclock=$(date +"%H:%M")
}
clock

conn() {
    rconn=$(nmcli d | grep wifi | awk '{print $4}')
}
conn

bat() {
    local bat=$(
        upower -b \
        | grep percentage \
        | awk '{print $2}' \
        | sed 's/%//g'
    )
    local status=$(
        upower -b \
        | grep state \
        | awk '{if (($2=="charging") || ($2=="fully-charged")) print "+"; else print "%"}'
    )
    rbat=$(printf '%s%s' $bat $status)
}
bat

printf '%s  %s  %s\n' $rconn $rbat $rclock
