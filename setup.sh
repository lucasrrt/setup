# ZSH and OH MY ZSH
# Installing
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# setup zsh config file
ln -f ./.zshrc ~/.zshrc

# NVim
# install VimPlug for plugins
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# setup nvim config file
ln -f ./init2.vim ~/.config/nvim/init.vim

# Execute nvim :PlugInstall
nvim -c PlugInstall -c qa --headless
