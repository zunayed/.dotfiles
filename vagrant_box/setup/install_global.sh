#!/bin/bash
PGSQL_VERSION=9.3
INSTALL_FILES=/vagrant_setup

# Install essential packages from Apt
apt-get update -y

# Python dev packages
apt-get install -y build-essential python python-dev python-pip
wget https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py -O - | python
apt-get install -y libjpeg-dev libtiff-dev zlib1g-dev libfreetype6-dev liblcms2-dev

# NFS shares will be slightly out of sync with the local time. Make files complain
apt-get install -y ntp

#shit I found on stackoverflow to instal lxml. da fuck is this shit
apt-get install -y python-dev libxml2 libxml2-dev libxslt-dev

# stuff we dev with
apt-get install -y git vim nginx supervisor curl wget zsh tmux

# Go + GoVim dependencies
apt-get install -y exuberant-ctags cmake golang

# Update kernal to install docker
# sudo apt-get -y install linux-image-generic-lts-trusty
wget -qO- https://get.docker.com/ | sh

# Postgresql
if ! command -v psql; then
    apt-get install -y postgresql-$PGSQL_VERSION libpq-dev
    apt-get install -y postgresql-server-dev-9.3
    cp $INSTALL_FILES/setup/pg_hba.conf /etc/postgresql/$PGSQL_VERSION/main/
    /etc/init.d/postgresql reload
fi

# Redis 
apt-get install -y redis-server

# Node, NPM, Grunt
curl https://deb.nodesource.com/setup | bash -
apt-get install -y nodejs
curl -L https://npmjs.com/install.sh | sh
npm install grunt -g

# Virtualenv and virtualenvwrapper
pip install virtualenv virtualenvwrapper 

# TODO
# fabricator 
# chef

