# NeoVim with Lua configs

Install the appimage from the official [neovim github page](https://github.com/neovim/neovim/wiki/Installing-Neovim)

Tip: Remove any other images you may have
```sh
# Ubuntu
$ sudo apt-get remove neovim
```

Move the image to a proper directory e.g ~/.neovim and link it to `/usr/bin/nvim`
```sh
$ mkdir ~/.neovim
$ mv ./nvim.appimage ~/.neovim
$ cd ~/.neovim
$ chmod u+x nvim.appimage
$ sudo ln nvim.appimage /usr/bin/nvim
```

Create an alias in the shell file
```sh
alias n="nvim"
```
