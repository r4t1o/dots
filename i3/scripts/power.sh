#!/usr/bin/env bash


## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## Github : @adi1090x
## Reddit : @adi1090x

rofi_command="rofi -theme $HOME/.config/i3/scripts/one-dark.rasi"

uptime=$(uptime -p | sed -e 's/up //g')
host=$(hostname)

# Options
shutdown=" Shutdown"
reboot=" Restart"
lock=" Lock"
suspend=" Sleep"
logout=" Logout"

# Variable passed to rofi
options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

#chosen="$(echo -e "$options" | $rofi_command -p "  $USER@$host - $uptime" -dmenu -selected-row 0)"
chosen="$(echo -e "$options" | $rofi_command -p " Goodbye, $USER!" -dmenu -selected-row 0)"
case $chosen in
    $shutdown)
        loginctl poweroff
        ;;
    $reboot)
        loginctl reboot
        ;;
    $lock)
        betterlockscreen -l
        ;;
    $suspend)
        mpc -q pause
        loginctl suspend
        ;;
    $logout)
        i3-msg exit
        ;;
esac

