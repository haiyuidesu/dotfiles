#!/bin/bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended &> /dev/null

if [ $? -ne 0 ]; then
    echo "[ERROR]: unable to install oh-my-zsh."
    exit 1
fi

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k &> /dev/null

echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

if [ $? -ne 0 ]; then
    echo "[ERROR]: unable to install powerlevel10k."
    exit 1
fi
