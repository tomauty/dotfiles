set -gx LSCOLORS gxfxcxdxbxegedabagacad

alias clock="tty-clock -Srx -C4"
alias g="git"
alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias c="clear"
alias x="exit"
alias htop="sudo htop"
alias clone="git clone"
alias mvi="mvn clean install"
alias mvid="mvn clean install -DskipTests"
alias vim="nvim"
alias ls="exa -l"
alias cat="ccat"
alias tmux="tmux new-session -A -s 1"
alias kc="kubectl"

set --export ANDROID $HOME/Library/Android
set --export ANDROID_HOME $ANDROID/sdk
set -gx PATH $ANDROID/sdk/tools $PATH
set -gx PATH $ANDROID/sdk/platform-tools $PATH
set -gx PATH /usr/local/lib/ruby/gems/2.5.0/bin $PATH
set -gx POWERLINE_PATH /usr/local/lib/python2.7/site-packages/powerline

set -gx KUBE_EDITOR /usr/bin/vim
set -gx EDITOR /usr/bin/vim

# Prompt (spacefish)
set -gx SPACEFISH_KUBECONTEXT_SHOW false
set -gx SPACEFISH_DATE_SHOW true
set -gx SPACEFISH_TIME_SHOW true

set -gx PKG_CONFIG_PATH /usr/local/lib/pkgconfig $PKG_CONFIG_PATH
set -gx PKG_CONFIG_PATH /usr/local/lib $PKG_CONFIG_PATH

set -gx CPPFLAGS -I/usr/local/opt/openssl/include
set -gx LDFLAGS -L/usr/local/opt/openssl/lib
set -gx NVIM_TUI_ENABLE_TRUE_COLOR 1

set -l GRUVBOX_SCRIPT ~/.vim/plugged/gruvbox/gruvbox_256palette.sh
if test -f $GRUVBOX_SCRIPT
	bash $GRUVBOX_SCRIPT
end

set -gx PYTHON_CONFIGURE_OPTS "--enable-framework"

function bump
	set -l now (date)
	git add . ; git commit -m 'Version Bump :: ' + $now ; git push
end

funcsave bump

# set -x PATH $HOME/.fastlane/bin $PATH
fish_vi_key_bindings

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/thomasauty/var/feuserapi-serverless/node_modules/tabtab/.completions/serverless.fish ]; and . /Users/thomasauty/var/feuserapi-serverless/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/thomasauty/var/feuserapi-serverless/node_modules/tabtab/.completions/sls.fish ]; and . /Users/thomasauty/var/feuserapi-serverless/node_modules/tabtab/.completions/sls.fish

# Prompt Stuff
set -g theme_display_ruby no        # Disables displaying the current ruby version
set -g theme_display_virtualenv no  # Disables displaying the current virtualenv name


# Show fun w1z@rd
#if status is-interactive
#    cat ~/Documents/wizard2.txt
#end

rvm default

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tauty/google-cloud-sdk/path.fish.inc' ]; . '/Users/tauty/google-cloud-sdk/path.fish.inc'; end

if status --is-interactive
	set BASE16_SHELL "$HOME/.config/base16-shell/"
	source "$BASE16_SHELL/profile_helper.fish"
end
