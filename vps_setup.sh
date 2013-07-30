#!/bin/bash

apt-get -y update && apt-get -y upgrade && apt-get -y install curl && apt-get -y install git-core && apt-get -y install python-software-properties && apt-get -y install locate

# rvm & ruby
\curl -L https://get.rvm.io | bash
source /etc/profile.d/rvm.sh
rvm requirements
rvm install 1.9.3

# nginx
add-apt-repository ppa:nginx/stable && apt-get -y update && apt-get -y install nginx && service nginx start

# mysql
apt-get install -y mysql-server && apt-get install -y libmysqlclient-dev && apt-get install -y mysql-client
sudo mysql_install_db
sudo /usr/bin/mysql_secure_installation
mysql -u root -p 
# CREATE USER 'rails'@'localhost' IDENTIFIED BY 'PASSWORD';
# GRANT ALL PRIVILEGES ON * . * TO 'rails'@'localhost';
# FLUSH PRIVILEGES;

# Node.js
add-apt-repository ppa:chris-lea/node.js && apt-get -y update && apt-get -y install nodejs

# add user
adduser olivierdo
/usr/sbin/visudo
#=> add olivierdo to sudoers => olivierdo       ALL=(ALL:ALL) ALL
#=> olivierdo ALL= NOPASSWD: /etc/init.d/unicorn_deployTest
su olivierdo
sudo usermod -a -G rvm olivierdo if install rvm :system
cat ~/.ssh/id_rsa.pub | ssh olivierdo@185.14.184.133 'cat >> ~/.ssh/authorized_keys'