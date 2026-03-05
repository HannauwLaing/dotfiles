# change capslock to control
setxkbmap -layout us -option ctrl:swapcaps
sleep 1


# whatsie &
# whatsie -t

# This is to make cat
make -C ~/FunCodes/oneko/ all 0<&- >/dev/null 2>&1 & disown &
sleep 1

# opens file explorer
nautilus &
sleep 1

# opens terminal
gnome-terminal &
sleep 3

firefox &
sleep 3

# cd &
# exit
