image=$(date +%s).png && maim -s -s -b 2.0 -p -5 -c 10,1,0.10 "$HOME/Pictures/Screenshots/$image" && dunstify -r "BFFF00" "Say cheese..." "$image" -a scrot &
