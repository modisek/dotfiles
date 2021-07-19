alias ..=' cd ..'
alias la='ls -hap --color'
alias ls='ls --color'
alias ll='ls -hpl --color'
alias lr='ls  -R --color'
alias cat='bat'
alias install="sudo apt install"
alias update="sudo apt update"
alias aliasconf="vim ~/dotfiles/bash/.bash_aliases"
alias polybarconf="vim ~/dotfiles/polybar/.config/polybar/config"
alias i3conf="vim ~/dotfiles/i3/.config/i3/config"
alias bconf="vim ~/dotfiles/bash/.bashrc"
alias vimconf="vim ~/dotfiles/nvim/.config/nvim/init.vim"
alias so="source ~/dotfiles/bash/.bashrc"
alias r="ranger"
alias c="clear"

#Tmux
alias t="tmux -2"
alias ta="t a -t"
alias tls="t ls"
alias tn="t new -t"
#create a new note

alias note='nvim -c :VimwikiMakeDiaryNote'
alias notes='nvim  -c :VimwikiIndex'
# cd after mkdir

alias xi='sudo xbps-install -S'
alias xr='sudo xbps-remove -R'
alias xq='xbps-query -Rs'
