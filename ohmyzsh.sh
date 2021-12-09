#!/bin/bash

_main() {
    which sudo >/dev/null && SUDO="sudo"
    which zsh > /dev/null || ${SUDO} apt-get install -y zsh

    if [ -d ~/.oh-my-zsh ];then
        echo "has been installed"
    else
        git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh \
        && [ -f ~/.zshrc ] &&  cp ~/.zshrc ~/.zshrc.orig \
        && cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc \
        && ${SUDO} chsh -s "$(which zsh)" \
        && echo "install oh-my-zsh success"
    fi
}

_main
