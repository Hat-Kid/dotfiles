#!/bin/sh
includes=/etc/X11/xinit/xinitrc.d
if [ -d "$includes" ]
then
for f in "$includes/"*
do
[ -x "$f" ] && . "$f"
done
unset f
fi
unset includes

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

noscreensaver
i3
#exec dbus-launch i3
#dbus-exec i3

eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK
