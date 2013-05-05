#
# Cookbook Name:: server
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

chef_gem "chef-rewind"
require 'chef/rewind'

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
ncftp

ntp
ntpdate

rkhunter
fail2ban
gld

graphicsmagick

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

# Additional apache modules not covered by the cookbook
%w{apache2-suexec}.each do |pkg|
  package pkg do
    action :install
  end
end
apache_module "suexec"



# Setup php
include_recipe "php"
include_recipe "php::module_curl"
include_recipe "php::module_mysql"
include_recipe "php::module_gd"
include_recipe "php::module_apc"



# Setup Mail
include_recipe "postfix"

rewind "template[/etc/postfix/master.cf]" do
  cookbook "server"
  source "postfix/master.cf.erb"
end



# Setup pureftpd
include_recipe "pureftpd"



# Tools
include_recipe "openssl"



# Git
include_recipe "git"
#include_recipe "git::server"



# Web Applications
include_recipe "phpmyadmin"
include_recipe "server::phpmyadmin"

include_recipe "roundcube"



# Security

# Fail2Ban
include_recipe "server::fail2ban"


