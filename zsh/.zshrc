# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Environment variables
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export PANEL_FIFO="/tmp/panel-fifo"
export PSQL_EDITOR='vim'

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

# Path entries
export PATH=$PATH:/usr/local:/usr/lib
export PATH=$PATH:$HOME/.rvm/bin
export PATH=$PATH:$HOME/.config/bspwm
export PATH=$PATH:$HOME/code/colors
export PATH=$PATH:$HOME/code/util
export PATH=$PATH:$HOME/.config/bspwm/panel

# ls
alias ls='ls --color -a -h -o -l -G'
alias cls='clear ; ls'
export LS_COLORS='di=34:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'

# git
alias gap='git add -p'
alias gb='git branch'
alias gg='git grep'
alias gs='git status'

# mpd / sound
alias mpd='mpd /home/tom/.mpd.conf'
alias nc='ncmpcpp'
alias vol="alsamixer"

# editing / navigation
alias c='clear'
alias ev='vim ~/.vimrc'
alias ez='vim ~/.zshrc'
alias nautilus="dbus-launch nautilus"   # Needed for network navigation
alias sz='source ~/.zshrc'
alias v='vim'
alias x="exit"
alias xclip="xclip -selection c"
alias r="ranger"
alias ..='cd ..'
alias df='df -h'
alias mkdir="mkdir -p"
alias zip="zip -9 -y -r -q"

# privileged access
alias scat='sudo cat'
alias svim='sudo vim'
alias root='sudo su'
alias reboot='sudo reboot'

# pacman-related
alias pacman="sudo pacman"
orphans() {
  if [[ ! -n $(pacman -Qdt) ]]; then
    echo "No orphans to remove."
  else
    sudo pacman -Rns $(pacman -Qdtq)
  fi
}


# work-related
alias nrs='npm run supervise'
alias w='cd ~/Work/app'
alias lines="cloc --exclude-dir=node_modules,bower_components,dist,static2 --quiet --unix --skip-uniqueness ."

# tmux
alias kt='killall tmux'
if [[ $TERM =~ rxvt-unicode-256color ]]; then
  exec tmux -2
fi

# Fun
alias clock='tty-clock -c -t -C 1'
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

# private aliases
if [ -f ~/.zshrc.private ]; then
    source ~/.zshrc.private
else
  print "Skipped private aliases"
fi

# (n/r)vm
source ~/.nvm/nvm.sh
source ~/.rvm/scripts/rvm

# colored man pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

unalias rm >/dev/null 2>/dev/null
