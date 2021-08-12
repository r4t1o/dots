#!/bin/sh

chosen=$(echo -e "     \n     \n    \n    " | rofi -dmenu -config /home/errxr/.config/rofi/power.rasi -lines 5 -eh 2 -padding 850 -font "Roboto 18" -p "                               Power Menu")

if [[ $chosen = "     " ]]; then
  ui=$(echo -e "           \n    " | rofi -dmenu -config /home/errxr/.config/rofi/power.rasi -lines 2 -eh 2 -padding 850 -font "Roboto 18" -p "                               Logout ?")
  if [[ $ui = "           " ]]; then
  i3-msg exit
fi
elif [[ $chosen = "    " ]]; then
  ui=$(echo -e "           \n    " | rofi -dmenu -config /home/errxr/.config/rofi/power.rasi -lines 2 -eh 2 -padding 850 -font "Roboto 18" -p "                               Shutdown ?")
  if [[ $ui = "           " ]]; then
  loginctl poweroff
fi
elif [[ $chosen = "    " ]]; then
  ui=$(echo -e "           \n    " | rofi -dmenu -config /home/errxr/.config/rofi/power.rasi -lines 2 -eh 2 -padding 850 -font "Roboto 18" -p "                               Reboot ?")
  if [[ $ui = "           " ]]; then
  loginctl reboot
fi	
elif [[ $chosen = "     " ]]; then
  ui=$(echo -e "           \n    " | rofi -dmenu -config /home/errxr/.config/rofi/power.rasi -lines 2 -eh 2 -padding 850 -font "Roboto 18" -p "                               Suspend ?")
  if [[ $ui = "           " ]]; then
  betterlockscreen -l dim  & loginctl suspend
fi	
elif [[ $chosen = "Hibernate" ]]; then
	loginctl hibernate
elif [[ $chosen = "Hybrid-sleep" ]]; then
	loginctl hibernate
elif [[ $chosen = "Suspend-then-hibernate" ]]; then
	loginctl suspend-then-hibernate
fi
