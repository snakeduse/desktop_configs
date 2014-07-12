#!/bin/sh

#nm-applet &
wicd-gtk --tray &
emacs &
google-chrome-stable &
urxvt &
xscreensaver -no-splash &
conky &

exec awesome
