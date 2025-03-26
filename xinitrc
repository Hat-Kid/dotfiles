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

export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_ENABLE_HIDPI_SCALING=0
export QT_SCALE_FACTOR=1.5

xrandr --dpi 139

xrdb ~/.Xresources

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

noscreensaver
i3
#exec dbus-launch i3
#dbus-exec i3

eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK
