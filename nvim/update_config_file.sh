# setup nvim config file
ln -f ./init.vim ~/.config/nvim/init.vim

# setup configs file
ln -fs $PWD/configs ~/.config/nvim

# Execute nvim :PlugInstall
nvim -c PlugInstall -c qa --headless
