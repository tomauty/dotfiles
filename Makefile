homebrew-install:
	ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

brew:
	brew install ack
	brew install alpine
	brew install autoconf
	brew install automake
	brew install bcrypt
	brew install boost
	brew install cmake
	brew install cmatrix
	brew install cmus
	brew install cowsay
	brew install cscope
	brew install doxygen
	brew install faac
	brew install faad2
	brew install ffmpeg
	brew install fftw
	brew install figlet
	brew install finch
	brew install flac
	brew install fluid-synth
	brew install fontconfig
	brew install fontforge
	brew install fortune
	brew install freetype
	brew install gettext
	brew install ghi
	brew install ghostscript
	brew install git-extras
	brew install glib
	brew install gmp
	brew install gnutls
	brew install graphicsmagick
	brew install htop-osx
	brew install hub
	brew install imagemagick
	brew install intltool
	brew install jbig2dec
	brew install jpeg
	brew install lame
	brew install libao
	brew install libcaca
	brew install libcue
	brew install libevent
	brew install libffi
	brew install libid3tag
	brew install libidn
	brew install libmpdclient
	brew install libogg
	brew install libpng
	brew install libsamplerate
	brew install libtasn1
	brew install libtiff
	brew install libtool
	brew install libvorbis
	brew install little-cms2
	brew install macvim
	brew install mad
	brew install mercurial
	brew install most
	brew install mp4v2
	brew install nettle
	brew install newsbeuter
	brew install node
	brew install p11-kit
	brew install pcre
	brew install phantomjs
	brew install pkg-config
	brew install protobuf
	brew install readline
	brew install reattach-to-user-namespace
	brew install rethinkdb
	brew install s-lang
	brew install sl
	brew install slrn
	brew install sqlite
	brew install tag
	brew install taglib
	brew install texi2html
	brew install tmux
	brew install toilet
	brew install tty-clock
	brew install vim
	brew install x264
	brew install xvid
	brew install xz
	brew install yasm
	brew install youtube-dl
	brew install npm
	brew install zsh
	brew tap phinze/cask
	brew install brew-cask
	brew tap homebrew/dupes
	brew install ncurses
	brew link --force ncurses

cask:
	brew cask install a-slower-speed-of-light
	brew cask install alfred
	brew cask alfred link
	brew cask install caffeine
	brew cask install ccleaner
	brew cask install google-chrome
	brew cask install grandperspective
	brew cask install monolingual
	brew cask install slate
	brew cask install steam
	brew cask install unrarx
	brew cask install vlc

git:
	git config --global user.name "tomauty"
	git config --global user.email "tomauty@umich.edu"
	git config --global core.editor vim
	git config --global core.pager less
	git config --global help.autocorrect 1
	git config --global color.ui true
	git config --global push.default simple

npm:
	sudo npm -g install bower
	sudo npm -g install coffee-script
	sudo npm -g install connect
	sudo npm -g install ctype
	sudo npm -g install express
	sudo npm -g install globule
	sudo npm -g install grunt
	sudo npm -g install grunt-cli
	sudo npm -g install grunt-contrib-coffee
	sudo npm -g install jade
	sudo npm -g install jshint
	sudo npm -g install jsonlint
	sudo npm -g install karma
	sudo npm -g install karma-chrome-launcher
	sudo npm -g install karma-coffee-preprocessor
	sudo npm -g install karma-firefox-launcher
	sudo npm -g install karma-html2js-preprocessor
	sudo npm -g install karma-jasmine
	sudo npm -g install karma-mocha
	sudo npm -g install karma-phantomjs-launcher
	sudo npm -g install karma-requirejs
	sudo npm -g install karma-script-launcher
	sudo npm -g install lodash
	sudo npm -g install mocha
	sudo npm -g install node-gyp
	sudo npm -g install node-protobuf
	sudo npm -g install pg
	sudo npm -g install protractor
	sudo npm -g install requirejs
	sudo npm -g install rethinkdb
	sudo npm -g install supervisor
	sudo npm -g install testem
	sudo npm -g install yo

python:
	sudo easy_install pip
	sudo pip install cffi
	sudo pip install pygit2
	sudo pip install mercurial
	sudo pip install psutil

