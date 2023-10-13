#!/bin/bash

tmp="Arc-latest.dmg"

if [ -d "/Applications/Arc.app" ]; then
    echo "[INFO]: Arc is already installed."
else
    mkdir tmp && cd tmp

    curl -L -O https://releases.arc.net/release/Arc-latest.dmg &> /dev/null

    if [ $? -eq 0 ]; then
        hdiutil attach "$tmp" &> /dev/null

        sudo cp -R /Volumes/Arc/Arc.app /Applications &> /dev/null

        hdiutil detach /Volumes/Arc &> /dev/null

        rm -f "$tmp"
    else
        echo "[ERROR]: Unable to download Arc."
    fi

    cd .. && rm -rf tmp
fi
