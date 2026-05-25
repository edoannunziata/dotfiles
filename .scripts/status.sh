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
    rbat=$(upower -b | grep percentage | awk '{print $2}')
}
bat

printf '%s  %s  %s\n' $rconn $rbat $rclock
