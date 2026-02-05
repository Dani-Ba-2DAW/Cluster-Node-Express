#!/bin/bash

apt-get update
apt-get upgrade -y

apt install -y curl
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo bash -
apt install -y nodejs

npm init
npm install express
cp /vagrant/config/app.js .
node app.js