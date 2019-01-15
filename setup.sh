#!/bin/bash

if command -v curl &> /dev/null; then
    sudo apt install curl
fi

if command -v git &> /dev/null; then
    sudo apt install git
fi

if command -v nvim &> /dev/null; then
    sudo apt install neovim
fi

if ! [-f "~/.config/nvim/init.vim"]; then
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    cp ./init.vim ~/.config/nvim/.
fi

if ! [-f "~/.zshrc"]; then
    sudo apt install zsh
    curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
    cp ./.zshrc ~
    chsh -s $(which zsh)
    echo "For the changes to take effect, log out now?[yn]:"
    select yn in "y" "n"; do
        case $yn in
            y ) gnome-session-quit; break;;
            n ) break;;
        esac
    done
fi
