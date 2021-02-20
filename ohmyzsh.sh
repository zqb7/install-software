#!/bin/bash

which zsh > /dev/null || apt-get install -y zsh
[ $SUDO_USER ] && user=$SUDO_USER || user=`whoami`


su $user << EOF
[ -d ~/.oh-my-zsh ] || \
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh && \
    [ -f ~/.zshrc ] &&  cp ~/.zshrc ~/.zshrc.orig || \
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
EOF

chsh -s $(which zsh)

echo "install oh-my-zsh success!"
