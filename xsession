#!/bin/bash

. $HOME/.profile


#iif [ "$HOST" = "kettle" ]; then
#    xset fp+ /usr/X11/lib/X11/fonts/freefont 
#    xset fp rehash
#fi

xrdb $HOME/.Xdefaults
xsetroot -solid steelblue4



# The planetlab biffs
#xbiff -bg black -fg white -g 30x30-60+368 -file $HOME/.pl/1 &
#xbiff -bg black -fg white -g 30x30-30+368 -file $HOME/.pl/2 &
#xbiff -bg black -fg white -g 30x30-0+368 -file $HOME/.pl/3 &

#/users/srg1/michael/Library/scripts/xloads &
xload -bg black -fg LightSlateBlue -g 90x90-0+276 &
#xload -bg black -fg LightSlateBlue -g 90x90-0+184 &

exec vtwm & 

#export PATH=$PATH:$HOME/library/bb/bin
#exec blackbox &
#exec fluxbox &

#bbkeys -i &

#xbiff    -bg gray0 -fg white -file /mail/mail/michael  -g 90x90-0+90  &
xbiff    -bg black -fg white -g 90x90-0+92 -file $HOME/.mail &

# Just set up my X environment as I like it
xset -b
xset m 1
setxkbmap -model pc104 -layout us

#xv /users/srg1/michael/misc/images/AquaBlue.jpg -root -max -quit

#xload    -fg green -bg black -hl red -g 90x90-0+276      
#xbiff    -bg black -fg white -g 90x60-1+92 &
xclock   -norender -sharp -fg white -hd white -hl white -bg gray0       -g 90x90-0+0   


