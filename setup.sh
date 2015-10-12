#!/bin/bash

sudo apt-get update
sudo apt-get install -y puppet puppet-common git ruby
gem install --no-rdoc r10k

sudo cp -a * /etc/puppet
sudo service puppet restart

cd /etc/puppet
r10k puppetfile install -v info
