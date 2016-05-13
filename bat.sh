#!/bin/sh
export DISPLAY=:0
bat=$(upower -i $(upower -e | grep BAT) | grep --color=never -E percentage|xargs|cut -d' ' -f2|sed s/%//i)
state=$(upower -i $(upower -e | grep BAT) | grep --color=never -E state|xargs|cut -d' ' -f2|sed s/%//i)
if [[ "$bat" -lt "10" ]] && [[ "$state" == "discharging" ]]; then
	notify-send 'Attention!' 'Battery is less than 10%' --icon=dialog-information
fi
