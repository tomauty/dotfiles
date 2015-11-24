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
export PATH=$PATH:$HOME/code/colors
export PATH=$PATH:$HOME/code/util
export PATH=$PATH:/usr/local/opt/coreutils/libexec/gnubin


# Add GHC 7.8.4 to the PATH, via http://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.8.4.app"
if [ -d "$GHC_DOT_APP" ]; then
  export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

alias ghostscript="gs"

# ls
alias ls='ls -a -h -o -l -G'
alias cls='clear ; ls'
export LS_COLORS='di=34:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'

# git
alias w='cd ~/MoneyLion/lionloansangularjs'
alias gap='git add -p'
alias gb='git branch'
alias gg='git grep'
alias gc='git checkout'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'

# df
alias fort="/Applications/Macnewbie/Dwarf\ Fortress/dfhack"


# mpd / sound
alias mpd='mpd /home/tom/.mpd.conf'
alias nc='ncmpcpp'
alias vol="alsamixer"

# editing / navigation
#alias vim='nvim'
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
alias nitrogen="nitrogen --sort=alpha"

# privileged access
alias scat='sudo cat'
alias svim='sudo vim'
alias root='sudo su'
alias reboot='sudo reboot'
alias mountusb="sudo mount -t hfsplus -o rw,force /dev/sdb2 /mnt/USB"

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
alias lines="cloc --exclude-dir=node_modules,__tests__,bower_components,dist,static2,docs --quiet --unix --skip-uniqueness "

# tmux
alias kt='killall tmux'
if [[ $TERM =~ rxvt-unicode-256color ]]; then
  exec tmux -2
fi
if [[ $TERM =~ xterm-256color ]]; then
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
fi

# (n/r)vm
source ~/.nvm/nvm.sh
#source ~/.rvm/scripts/rvm

# colored man pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

export SLACK_API_TOKEN="xoxb-12780441543-1pyTLDix3ZiUJ44G0b6B1E53"

export PYTHON=python2.7

#export PATH=${PATH}:/usr/lib/jvm/default/bin
unalias rm >/dev/null 2>/dev/null
KEYTIMEOUT=1
export ANDROID_HOME=/opt/android-sdk

alias droplet="ssh tom@104.131.231.245"
unalias scp >/dev/null 2>/dev/null
export ANDROID_HOME=/usr/local/opt/android-sdk

unalias rsync >/dev/null 2>/dev/null
