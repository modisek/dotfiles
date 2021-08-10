alias ..=' cd ..'

alias la='exa -a --icons'
alias ls='exa  --icons'
alias ll='exa -l --icons'
alias lr='exa -R --icons'
alias cat='bat'
alias aliasconf="nvim ~/dotfiles/bash/.bash_aliases"
alias polybarconf="nvim ~/dotfiles/polybar/.config/polybar/config"
alias i3conf="nvim ~/dotfiles/i3/.config/i3/config"
alias bconf="nvim ~/dotfiles/bash/.bashrc"
alias vimconf="nvim ~/dotfiles/nvim/.config/nvim/init.vim"
alias so="source ~/dotfiles/bash/.bashrc"
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
