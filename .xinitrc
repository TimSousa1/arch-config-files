#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

setxkbmap -layout pt
numlockx on

xrandr --newmode "1920x1080_239.76" 594.270  1920 1952 1984 2040  1080 1137 1145 1215  +HSync -VSync
xrandr --addmode DP-1-1 1920x1080_239.76
xrandr --output DP-1-1 --primary --mode 1920x1080_239.76 --rotate left --left-of eDP-2
xrandr --output HDMI-1-0 --auto --left-of DP-1-1

xinput set-prop $(xinput list | grep "DeathAdder Elite" | grep "pointer" | grep -v "Keyboard"| cut -f 2 | grep -o '[0-9]\+') "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 2


nitrogen --restore &
picom &
bash /home/tim/.config/polybar/launch.sh &
exec /usr/bin/qtile start



#twm &
#xclock -geometry 50x50-1+1 &
#xterm -geometry 80x50+494+51 &
#xterm -geometry 80x20+494-0 &
#exec xterm -geometry 80x66+0+0 -name login
