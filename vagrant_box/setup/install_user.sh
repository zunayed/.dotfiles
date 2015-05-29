#!/bin/bash

# pip conf for our private pip repo
mkdir ~/.pip/
cp /vagrant_setup/setup/pip.conf ~/.pip/

# Zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
echo "source ~/.bashprofile" >> ~/.zshrc

# Tmux to automatically load on session start
cat <<EOT >> ~/.bashprofile
if command -v tmux>/dev/null; then
    [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi
EOT

# virtualenv wrapper
echo "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python" >> ~/.bashprofile
echo "export WORKON_HOME=~/virtualenvs" >> ~/.bashprofile
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashprofile

# Go Lang
echo "export GOPATH=~/projects/go" >> ~/.bashprofile
source ~/.bashprofile
