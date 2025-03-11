if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias v nvim
alias vim nvim
alias x exit
alias c clear
alias gs "git status"
alias gdc "git diff --cached"
alias gd "git diff"

function jcurl
    curl $argv | jq
end

fish_vi_key_bindings
set fish_greeting

set -gx ANDROID_HOME ~/Library/Android/sdk
set -gx PATH $ANDROID_HOME/emulator $ANDROID_HOME/tools $ANDROID_HOME/tools/bin $ANDROID_HOME/platform-tools $PATH
