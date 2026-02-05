#!/bin/bash

apt-get update
apt-get upgrade -y

apt install -y npm

npm init
npm install express
cp /vagrant/config/app.js .