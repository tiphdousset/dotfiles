#!/bin/sh
#export DISPLAY=:0
bat=$(upower -i $(upower -e | grep BAT) | grep --color=never -E percentage|xargs|cut -d' ' -f2|sed s/%//i)
state=$(upower -i $(upower -e | grep BAT) | grep --color=never -E state|xargs|cut -d' ' -f2|sed s/%//i)

DBUS_SESSION_BUS_ADDRESS=`grep "DBUS_SESSION_BUS_ADDRESS=" /home/tiphanie/.dbus/session-bus/*-0 | cut -d "=" -f 2-`
export DISPLAY=:0

if [[ "$bat" -lt "10" ]] && [[ "$state" == "discharging" ]]; then
#DISPLAY=${DISPLAY} DBUS_SESSION_BUS_ADDRESS=${DBUS_ADDRESS} notify-send "Attention!" "Battery is less than ${bat}%" --icon=dialog-information
    XDG_RUNTIME_DIR=/run/user/1000 espeak "The battery is less than "$bat" percent" > /home/tiphanie/error.log 2>&1
fi
