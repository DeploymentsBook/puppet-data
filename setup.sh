#!/bin/bash

sudo apt-get update
sudo apt-get install -y puppet puppet-common git librarian-puppet

sudo cp -a * /etc/puppet
sudo service puppet restart

cd /etc/puppet
librarian-puppet install --clean
