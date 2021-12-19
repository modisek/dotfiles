alias ..=' cd ..'
alias la='ls -a --color'
alias ls='ls --color'
alias ll='ls -la --color'
alias cat='bat'
alias aliasconf="nvim ~/dotfiles/bash/.bash_aliases"
alias polybarconf="nvim ~/dotfiles/polybar/.config/polybar/config"
alias i3conf="nvim ~/dotfiles/i3/.config/i3/config"
alias bconf="nvim ~/dotfiles/bash/.bashrc"
alias vimconf="nvim ~/dotfiles/nvim/.config/nvim/init.vim"
alias so="source ~/dotfiles/bash/.bashrc"
alias c="clear"
alias sudo="doas"
#Tmux
alias t="tmux -2"
alias ta="t a -t"
alias tls="t ls"
alias tn="t new -t"
#create a new note

alias note='nvim -c :VimwikiMakeDiaryNote'
alias notes='nvim  -c :VimwikiIndex'
# cd after mkdir
alias docker='podman'
alias neofetch='neofetch --disable uptime packages resolution theme icons cpu gpu'
alias swagger='docker run --rm -it  --user $(id -u):$(id -g) -e GOPATH=$(go env GOPATH):/go -v $HOME:$HOME -w $(pwd) quay.io/goswagger/swagger'
