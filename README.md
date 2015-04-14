####*.files*

Managed with GNU Stow

#####Basic Use
`stow` will create symlinks in the parent of `cwd`. So if you run `stow bspwm` in `~/dotfiles`, it will symlink the structure inside of the `~/dotfiles/bspwm` folder in `~`.

#####Examples
"I want to install Tom's ZSH settings"


`stow zsh`

"I want to remove Tom's ZSH settings."

`stow -D zsh`

#####Screenshot (4/14/2015)
![Screenshot](http://i.imgur.com/dZclE9h.png)
