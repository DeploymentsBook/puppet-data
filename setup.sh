#!/bin/bash

sudo apt-get update
sudo apt-get install -y puppet puppet-common ruby
sudo gem install --no-rdoc r10k

sudo cp -a * /etc/puppet
sudo service puppet restart

cd /etc/puppet
sudo r10k puppetfile install -v info
