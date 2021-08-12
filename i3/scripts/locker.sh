#!/bin/sh

xautolock -time 1 -locker betterlockscreen -notify 20 -notifier 'xset dpms force off' &
