###################################################################################################
#                                       tom's .zshrc                                              #
###################################################################################################

####################
# (Oh My + ) ZSH Settings
####################
#
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="edvardm"
DISABLE_AUTO_TITLE="false"
HIST_STAMPS="dd.mm.yyyy"

plugins=(git tmux brew)

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
export PATH=$PATH:$HOME/.rvm/bin

####################
# Aliases
####################

# ZSH-related aliases
alias ohmyzsh='vim ~/.oh-my-zsh'
alias sz='source ~/.zshrc'
alias ez='vim ~/.zshrc'

# Git aliases
alias gap='git add -p'
alias git-visual='git log --graph --full-history --all --pretty=format:'%h%x09%d%x20%s''
alias gs='git status'

# mpd etc
alias mpd='mpd ~/.mpd.conf'
alias nc='ncmpcpp'

# ls
alias ls='ls -a -h -o -l -G'
alias cls='clear ; ls'

# Misc.
alias OSXey='clear && OSXey -c'
alias c='clear'
alias clearlogs='sudo rm /var/log/asl/*.asl'
alias clock='tty-clock -c -t -C 1'
alias gem='sudo gem'
alias rainbow='toilet --filter gay'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'

# Private aliases not committed
if [ -f ~/dotfiles/.zshrc.private ]; then
    source ~/dotfiles/.zshrc.private
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

# Preferred editor for local and remote sessions

####################
# RVM boilerplate
####################
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function


####################
# gruvbox palette
####################

# Uncomment if using the gruvbox iterm2 schemes
# ~/dotfiles/gruvbox.sh


