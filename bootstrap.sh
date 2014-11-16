#!/bin/bash

# The ouput of all these installation steps is noisy. With this utility
# the progress report is nice and concise.
function installing {
  echo "installing $1"
  shift
  apt-get -y install "$@" >/dev/null 2>&1
}

echo "Updating package information"
apt-get -y update >/dev/null 2>&1

installing 'development tools' build-essential

installing 'Git vcm' git
installing 'SQLite tool' sqlite3 libsqlite3-dev
installing 'Vim editor' vim

echo "Install Ruby"
cd /tmp && rm -rf ruby-install && git clone https://github.com/postmodern/ruby-install.git >/dev/null 2>&1
cd ruby-install && sudo make install >/dev/null 2>&1
cd /tmp && rm -rf chruby && git clone https://github.com/postmodern/chruby.git >/dev/null 2>&1
cd chruby && sudo make install >/dev/null 2>&1
ruby-install ruby 2.1.5 >/dev/null 2>&1

echo "source /usr/local/share/chruby/chruby.sh" >> /home/vagrant/.bashrc
echo "chruby 2.1.5" >> /home/vagrant/.bashrc

# Switching to
source /usr/local/share/chruby/chruby.sh
chruby 2.1.5

echo "Install bundler and padrino "
gem install bundler --no-document
gem install padrino

