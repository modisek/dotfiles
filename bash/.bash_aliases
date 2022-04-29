alias ..=' cd ..'
alias la='exa -a --icons'
alias ls='exa --icons'
alias ll='exa -la --icons'
alias cat='bat'
alias c="clear"
alias sudo="doas"
#Tmux
alias t="tmux -2"
alias ta="t a -t"
alias tls="t ls"
alias tn="t new -t"
#create a new note
alias mpv=' mpv --hwdec=auto'
alias note='nvim -c :VimwikiMakeDiaryNote'
alias notes='nvim  -c :VimwikiIndex'
# cd after mkdir
alias docker='podman'
alias neofetch='neofetch --disable uptime packages resolution theme icons cpu gpu'

function mkcd(){
    mkdir $@ && cd $@
}

