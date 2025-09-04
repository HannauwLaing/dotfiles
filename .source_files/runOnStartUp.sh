firefox &
# whatsie &
# whatsie -t

# This is to make cat
make -C ~/FunCodes/oneko/ all 0<&- >/dev/null 2>&1 & disown &

# change capslock to control
setxkbmap -layout us -option ctrl:swapcaps

nautilus &
gnome-terminal
# ~/backgrounds/change-background.sh &
cd &
exit
