#!/bin/sh
#      _      _ _
# __ _(_)_ _ (_) |_
# \ \ / | ' \| |  _|
# /_\_\_|_||_|_|\__|


# Init primary display
xrandr --output LVDS --auto --primary

# Try to init the second monitor if I've plugged one in
xrandr --output DisplayPort-1 --auto --right-of LVDS

# Copied colors from a mac display
/usr/bin/xcalib -d :0 /usr/share/color/icc/Mac.icc

# Start MPD
[[ -z $(pgrep -xU $UID mpdscribble) ]] && mpdscribble &
/usr/bin/mpd /home/tom/.mpd.conf

# Load up colors
xrdb -load /home/tom/.Xresources

# Bind keys
xbindkeys

# Make sure fonts are available
xset +fp ${HOME}/.fonts/
xset +fp /usr/share/fonts
xset +fp /usr/share/fonts/local
xset +fp /usr/share/fonts/misc
xset fp rehash

# Fix cursor
xsetroot -cursor_name left_ptr

# Turn off auto-sleep, it annoys me more than it helps
xset -dpms
xset s 0

# Maximize the brightness
# Also useful so that brightness-up/down steps will max out
# at maximum brightness
./max_brightness

urxvtd -q -o -f
# Set background, compton, bspwm keybindings and bspwm itself
nitrogen --restore &
#compton &
transmission-daemon &
sxhkd &
exec bspwm -c /home/tom/.config/bspwm/bspwmrc
