# ~/.profile: executed by the command interpreter for login shells.

# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

 if [ -f $HOME/.kshrc -a -r $HOME/.kshrc ]; then
	ENV=$HOME/.kshrc		# set ENV if there is an rc file
    export ENV
fi
# Styling QT apps with chosen GTK themes:
#
# Adwaita themes - install 'adwaita-qt' package, then ...
#export QT_STYLE_OVERRIDE=Adwaita
#export QT_STYLE_OVERRIDE=Adwaita-Dark
#
# Non-adwaita themes - install 'qt5-style-plugins' package, then ...
export QT_QPA_PLATFORMTHEME=gtk
export DOTS="/home/nerdroid/Dotfiles"
export TERMINAL="urxvt"
export PROJ="/home/nerdroid/projects"
export JAVA_HOME="/usr/lib/jvm/openjdk11"
export VISUAL=nvim
export EDITOR="$VISUAL"

export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/scripts:$PATH
export PATH=$HOME/.deno/bin:$PATH

export BROWSER=firefox
# Add default node to path
export PATH="$PATH:$(go env GOPATH)/bin"
# make CapsLock behave like Ctrl:
setxkbmap -option ctrl:nocaps

# make short-pressed Ctrl behave like Escape:
xcape -e 'Control_L=Escape'
