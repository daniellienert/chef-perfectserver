#!/bin/bash
apt-get -q -y install build-essential ruby-dev
gem install chef --version 10.24.4 --no-rdoc --no-ri --conservative