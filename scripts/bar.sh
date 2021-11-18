#!/usr/bin/env bash
FG='#aaaaaa'
BG='#333333'
FONT='-*-terminus-*-r-normal-*-*-120-*-*-*-*-iso8859-*'
color='^fg(#eda622)'
pkill dzen2 
while true;do
    upt=$(uptime -p | awk '{print $1" "$2" " $3}' | tr ',' ' ')
    media=$(mpc current )
    time=$(date "+ %B %d (%a) %H:%M ")
    batt_cap=$(acpi | awk '{print $4}' | tr ',' ' ')
    batt_status=$(acpi | awk '{print $4""$3}' | tr ',' ' ' | sed "s/Discharging/-/; s/Charging/+/")
    ip=$(ip addr| grep  wlp2s0 | awk '/inet/ {print $2}')
    volume=$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')
    echo  " $color<<$(hostname)>>^bg()^fg() (${upt}) $color Battery:^fg()${batt_status} $color Volume:^fg()${volume}$color Time:^fg()${time}"
    sleep 0.5
done | dzen2 -e - -h '14' -w '1700' -ta l -fg $FG -bg $BG -fn $FONT &
