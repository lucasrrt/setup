# NeoVim with Lua configs

## Install
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

## Setup
### Using symlink
Edit the setup file and add the env var `DESTDIR and SOURCEDIR`. For instance:
```sh
# setup.sh
#!/bin/sh
DESTDIR="/home/user_name/.config/nvim"
SOURCEDIR="/home/user_name/programming/setup/nvim-lua" # This repo

# ... rest of the file
```

Run setup file from inside the nvim-lua folder
```sh
$ sh setup.sh
```

You can check if it worked by going in the DESTDIR (Usually `~/.config/nvim`) and checking if the files were linked correctly.
```sh
$ l

# The links should point to the correct file
```
