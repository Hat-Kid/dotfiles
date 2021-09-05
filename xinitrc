#!/bin/sh
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

exec dbus-launch i3
xset s off
xset -dpms
xset s noblank
