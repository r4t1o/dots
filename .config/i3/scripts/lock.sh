
#!/usr/bin/env bash

## welcome the the shack
# --greeter-text="$(mpc $current | head -n 1)"			\

## Get colors -----------------
FG="#f5f5f3"
BG="#0f101c"

BLACK="#0f101c"
RED="#e95d68"
GREEN="#85ffd0"
YELLOW="#d67d68"
BLUE="#8c98ff"
MAGENTA="#a185ff"
CYAN="#91fbff"
WHITE="#e8f6ff"

TOTD=`fortune -n 90 -s | head -n 1`
UP=`uptime -p`

## Exec	-----------------
i3lock \
--blur 5                       \
\
--insidever-color=${GREEN}	\
--insidewrong-color=${RED}	\
--inside-color="${BG}00"	\
\
--ringver-color=${GREEN}	\
--ringwrong-color=${RED}	\
--ring-color=${BLUE}		\
\
--line-color=${BG}			\
--separator-color=${BG}		\
\
--keyhl-color=${YELLOW}		\
--bshl-color=${RED}			\
\
--verif-color=${BG}			\
--wrong-color=${FG}			\
--layout-color=${FG}		\
\
--time-color=${FG}			\
--date-color=${FG}			\
\
--pass-media-keys			\
--pass-screen-keys			\
--pass-power-keys			\
--pass-volume-keys			\
--{time,date,layout,verif,wrong,greeter}-font="DejaVu Sans Mono Nerd Font Complete Mono"			\
--{layout,verif,wrong,greeter}-size=18							\
--time-size=34													\
--date-size=18													\
--greeter-text="$(musicstat)"			\
--greeter-color=${WHITE}				\
--verif-text="verifying..."			\
--wrong-text="wrong!"				\
--noinput-text="Empty"				\
--lock-text="Locking..."			\
--lockfailed-text="Failed to lock"	\
--radius 130				\
--ring-width 6.0			\
--screen 1					\
--clock						\
--indicator					\
--time-str="%I:%M %p"		\
--date-str="%b %d, %G"		\
#--blur 5					\
