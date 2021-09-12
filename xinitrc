#!/bin/sh
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

noscreensaver
#i3
exec dbus-launch i3
