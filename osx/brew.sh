binaries=(
  ack
  autoconf
  automake
  boost
  brew-cask
  cairo
  cloc
  cmake
  coreutils
  cscope
  ctags
  gdbm
  gettext
  ghi
  ghostscript
  git
  glib
  graphicsmagick
  htop-osx
  hub
  imagemagick
  jpeg
  libevent
  libffi
  libmpdclient
  libpng
  libtiff
  libtool
  libyaml
  little-cms2
  macvim
  mutt
  ncmpcpp
  openssl
  osxfuse
  pixman
  pkg-config
  qt
  rbenv
  readline
  reattach-to-user-namespace
  redis
  ruby-build
  stow
  taglib
  the_silver_searcher
  tmux
  transmission
  vim
  xz
  zeromq
  zsh
)

heads=(
  neovim
)

echo "Installing homebrew binaries..."
brew install ${binaries[@]}
echo "Installing HEAD formulae..."
brew install --HEAD ${heads[@]}
