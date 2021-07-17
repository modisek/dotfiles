alias ..=' cd ..'
alias la='ls -hap --color'
alias ls='ls --color'
alias ll='ls -hpl --color'
alias lr='ls  -R --color'
alias cat='bat'
alias install="sudo apt install"
alias update="sudo apt update"
alias aliasconf="vim ~/Dotfiles/bash/.bash_aliases"
alias polybarconf="vim ~/Dotfiles/polybar/.config/polybar/config"
alias i3conf="vim ~/Dotfiles/i3/.config/i3/config"
alias bconf="vim ~/Dotfiles/bash/.bashrc"
alias vimconf="vim ~/Dotfiles/nvim/.config/nvim/init.vim"
alias so="source ~/Dotfiles/bash/.bashrc"
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

alias fix_light='sudo chown nerdroid /sys/class/backlight/intel_backlight/brightness'

#function killp (){
#        kill $(lsof -ti:$@)

#}

#function mcd (){

#mkdir -p $@ && builtin cd $@

#}

