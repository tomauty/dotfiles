###################################################################################################
#                                       tom's .zshrc                                              #
###################################################################################################

####################
# (Oh My + ) ZSH Settings
####################

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="kafeitu"
DISABLE_AUTO_TITLE="false"
HIST_STAMPS="dd.mm.yyyy"

# omzsh plugins
plugins=(git brew history-substring-search)

source $ZSH/oh-my-zsh.sh
export PSQL_EDITOR='vim'
export EDITOR='vim'

####################
# PATH
####################
export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/texbin:$PATH
export PATH=/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH
export PATH=/opt/local/bin:$PATH
export PATH=$HOME/.tmuxifier/bin:$PATH
export PATH=$HOME/local/bin:$PATH
export PATH=$HOME/.rvm/bin:$PATH
export PATH=$HOME/Library/Python/2.7/bin:$PATH
export PATH=$PATH:$GOPATH/bin

####################
# Aliases
####################

# ZSH-related aliases
alias ez='vim ~/.zshrc'
alias sz='source ~/.zshrc'
alias ohmyzsh='vim ~/.oh-my-zsh'

# Git aliases
alias gap='git add -p'
alias gb='git branch'
alias gg='git g'
alias git-visual='git log --graph --full-history --all --pretty=format:'%h%x09%d%x20%s''
alias gs='git status'

# mpd
alias mpd='mpd ~/.mpd.conf'
alias nc='ncmpcpp'

# vim
alias ev='vim ~/.vimrc'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias v='vim'

# ls
alias cls='clear ; ls'
alias ls='ls -a -h -o -l -G'

# gzip
alias gunzip='gzip -d -v'

# Misc.
alias c='clear'
alias clearlogs='sudo rm /var/log/asl/*.asl'
alias clock='tty-clock -c -t -C 1'
alias gem='sudo gem'
alias rainbow='toilet --filter gay'
alias OSXey='clear && OSXey -c'
alias w='cd ~/Work/app'
alias news='newsbeuter'
alias feeds='vim ~/.newsbeuter/urls'
alias newsconfig='vim ~/.newsbeuter/config'

# Private aliases not committed
if [ -f ~/dotfiles/zshrc.private ]; then
    source ~/dotfiles/zshrc.private
else
  print "Skipped private aliases"
fi

####################
# Functions for fun
####################

function box(){
  clear;
  t="$1xxxx";
  c=${2:-=};
  echo ${t//?/$c};
  echo "$c $1 $c";
  echo ${t//?/$c};
}

heading () {
  for i
    do clear ; hr ; figlet $i ; hr
  done
}

####################
# tmux
####################
alias et='vim ~/.tmux.conf'
alias kt='killall tmux'
alias lt='tmuxifier load-session'
alias tmux='tmux -2'
export TMUXIFIER_LAYOUT_PATH="$HOME/dotfiles/tmux-layouts"

if [[ ! $TERM =~ screen ]]; then
  exec tmux -2
fi

eval "$(tmuxifier init -)"

####################
# Misc.
####################

# Uncomment if using the gruvbox iterm2 schemes
# ~/dotfiles/gruvbox.sh

# Enable vi-mode for command editing
bindkey -v

