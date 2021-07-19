source ~/dotfiles/bash/.bash_aliases
set fish_greeting
export BROWSER=firefox
export EDITOR=nvim
set -gx TERM xterm-256color

alias o='xdg-open'
# make short-pressed Ctrl behave like Escape:
alias vim='nvim'
# aliases

alias g git
command -qv nvim && alias vim nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/.cargo/bin $PATH
set -gx PATH ~/.deno/bin $PATH
function mcd
  mkdir -p $argv; cd $argv
end
function fish_user_key_bindings
  # peco
  bind \cr peco_select_history # Bind for peco select history to Ctrl+R
  bind \cf peco_change_directory # Bind for peco change directory to Ctrl+F

  # vim-like
  bind \cl forward-char
end
function _peco_change_directory
  if [ (count $argv) ]
    peco --layout=bottom-up --query "$argv "|perl -pe 's/([ ()])/\\\\$1/g'|read foo
  else
    peco --layout=bottom-up |perl -pe 's/([ ()])/\\\\$1/g'|read foo
  end
  if [ $foo ]
    builtin cd $foo
  else
    commandline ''
  end
end

function peco_change_directory
  begin
    echo $HOME/.config
    ghq list -p
    ls -ad */|perl -pe "s#^#$PWD/#"|grep -v \.git
    ls -ad /home/nerdroid/Documents//*/* |grep -v \.git
  end | sed -e 's/\/$//' | awk '!a[$0]++' | _peco_change_directory $argv
end
function peco_select_history
  if test (count $argv) = 0
    set peco_flags --layout=bottom-up
  else
    set peco_flags --layout=bottom-up --query "$argv"
  end

  history|peco $peco_flags|read foo

  if [ $foo ]
    commandline $foo
  else
    commandline ''
  end
end

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"


zoxide init fish | source
