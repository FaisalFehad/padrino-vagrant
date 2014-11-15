# The ouput of all these installation steps is noisy. With this utility
# the progress report is nice and concise.
function install {
  echo installing $1
  shift
  apt-get -y install "$@" >/dev/null 2>&1
}

echo "Updating package information"
apt-get -y update >/dev/null 2>&1

install 'development tools' build-essential

install Git git
install SQLite sqlite3 libsqlite3-dev
install Vim vim

echo "Install Ruby"
cd /tmp && rm -rf ruby-install && git clone https://github.com/postmodern/ruby-install.git >/dev/null 2>&1
cd ruby-install && git checkout v0.5.0 >/dev/null 2>&1 && sudo make install >/dev/null 2>&1
cd /tmp && rm -rf chruby && git clone https://github.com/postmodern/chruby.git >/dev/null 2>&1
cd chruby && sudo make install >/dev/null 2>&1
ruby-install ruby 2.1.3 >/dev/null 2>&1

echo "source /usr/local/share/chruby/chruby.sh" >> /home/vagrant/.bashrc
echo "chruby 2.1.3" >> /home/vagrant/.bashrc

echo "Install bundle and padrino"
gem install bundler --no-ri --no-rdoc

