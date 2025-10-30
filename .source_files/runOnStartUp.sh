# change capslock to control
setxkbmap -layout us -option ctrl:swapcaps
sleep 1


firefox &
sleep 1
# whatsie &
# whatsie -t

# This is to make cat
make -C ~/FunCodes/oneko/ all 0<&- >/dev/null 2>&1 & disown &
sleep 1

# opens terminal
nautilus &
sleep 1

gnome-terminal
sleep 1
# ~/backgrounds/change-background.sh &
cd &
exit
