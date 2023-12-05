#!/usr/bin/env sh


set -xe

if [[ $1 = "always" ]]; then
    touchegg &
    picom -b
    nm-applet
    ssh-agent
    blueman-applet
    if [[xss-lock --transfer-sleep-lock -- light-locker-command --lock]];then
        light-locker --no-late-locking --lock-on-lid --lock-on-suspend
    else
        echo "xss-lock bind failed" > $HOME/.config/.config.log
    fi
    export $AUTOSTART_ONCE=1
else
    mpDris2 -c $HOME/.config/mpDris2/mpDris2.conf
    variety &
    gnome-settings-daemon
    emacs --with-profile doom --bg-daemon
    keepassxc
    lxpolkit
    setxkbmap -model pc105 -layout us,pl -option grp:alt_shift_toggle
    export AUTOSTART_ALWAYS=1
fi
