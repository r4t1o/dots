#!/usr/bin/env bash
o0=""
o1=""
o2=""
o3="⏼"
o4=""
a1=""
a2=""
option="$o4\n$o1\n$o3\n$o2\n$o0"
answer="$a1\n$a2"
chosen="$(echo -e "$option" | rofi -theme ~/.config/rofi/powermenu/powermenu.rasi -lines 5 -dmenu)"
if [ -z "$chosen" ]; then
				exit
else
				sure="$(echo -e "$answer" | rofi -theme ~/.config/rofi/powermenu/powermenu-confirm.rasi -lines 2 -dmenu)"
				case $chosen$sure in
								$o0$a1)
									i3-msg exit;;
								$o1$a1)
									systemctl suspend;;
								$o2$a1)
									reboot;;
								$o3$a1)
									poweroff;;
								$o4$a1)
									exec bash ~/.config/i3/scripts/lock.sh;;
				esac
fi
