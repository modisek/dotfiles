xsetroot -solid "#282120"&
xrdb -merge ~/.Xresources
sxhkd&
xset r rate 300 50
doas rfkill unblock all
~/dotfiles/scripts/bar.sh&
exec dbus-run-session --  cwm
