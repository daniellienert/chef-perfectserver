#
# Cookbook Name:: server
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'ohai'

# Basic Packages
include_recipe "apt"
include_recipe "ubuntu"
include_recipe "build-essential"


# Install packages

%w{
joe
htop
unzip
bzip2
zip
pwgen

ntp
ntpdate

rkhunter
fail2ban

dovecot-mysql
dovecot-sieve
dovecot-imapd
dovecot-pop3d
}.each do |pkg|
  package pkg do
    action :install
  end
end

# Setup database Server
include_recipe "mysql"
include_recipe "mysql::server"
include_recipe "database::mysql"

# Setup apache
include_recipe "apache2"
include_recipe "apache2::mod_ssl"
include_recipe "apache2::mod_php5"
include_recipe "apache2::mod_rewrite"
include_recipe "apache2::mod_fastcgi"
include_recipe "apache2::mod_fcgid"

# Setup php
include_recipe "php"
include_recipe "php::module_curl"
include_recipe "php::module_mysql"
include_recipe "php::module_gd"
include_recipe "php::module_apc"

# Setup Mail
include_recipe "postfix"

# Setup pureftpd
include_recipe "pureftpd"

# Tools
include_recipe "imagemagick"
include_recipe "openssl"

# Git
include_recipe "git"
#include_recipe "git::server"

# Web Applications
include_recipe "phpmyadmin"
include_recipe "server::phpmyadmin"

include_recipe "roundcube"


