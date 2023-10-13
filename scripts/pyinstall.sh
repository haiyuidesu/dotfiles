#!/bin/bash

if command -v python2 &> /dev/null; then
    echo "[INFO]: Python 2.7 is already installed."
else
    mkdir tmp && cd tmp

    curl "https://www.python.org/ftp/python/2.7.18/python-2.7.18-macosx10.9.pkg" -o ./installer.pkg &> /dev/null

    sudo installer -pkg ./installer.pkg -target / &> /dev/null

    if [ $? -ne 0 ]; then
        echo "[ERROR]: Unable to install Python 2.7."
        exit 1
    fi

    curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o ./get-pip2.py &> /dev/null
    python2 get-pip2.py &> /dev/null
    rm get-pip2.py

    python2 -m pip install --upgrade pip &> /dev/null

    echo 'alias pip2="python2 -m pip"' >> ~/.zshrc
    echo 'alias venv3="virtualenv -p python3"' >> ~/.zshrc
    echo 'alias venv2="virtualenv -p python2"' >> ~/.zshrc
    echo 'export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH"' >> ~/.zshrc

    curl https://raw.githubusercontent.com/python/cpython/2.7/Lib/plistlib.py \
        -o /Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/plistlib.py &> /dev/null

    cd .. && rm -rf tmp
fi
