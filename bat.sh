#!/bin/bash
bat="upower -i $(upower -e | grep BAT) | grep --color=never -E percentage|xargs|cut -d' ' -f2|sed s/%//i"
p=$(eval $bat)
if [ "$p" -lt "10" ]; then
	notify-send 'Attention!' 'Battery is less than 10%' --icon=dialog-information
fi
