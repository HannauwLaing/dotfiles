# change capslock to control
setxkbmap -layout us -option ctrl:nocaps
sleep 1


# whatsie &
# whatsie -t


# opens file explorer
nautilus &
sleep 1

# opens terminal
gnome-terminal &
sleep 3

firefox &
sleep 3

# This is to make cat
make -C ~/bin/oneko/ run 0<&- >/dev/null 2>&1 & disown &
sleep 1

# cd &
# exit
