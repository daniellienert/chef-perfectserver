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
include_recipe "build-essential"

# Install packages
%w{
joe
htop
}.each do |pkg|
  package pkg do
    action :install
  end
end

# Setup databases
include_recipe "mysql"
include_recipe "mysql::server"
include_recipe "database::mysql"

# Setup apache
include_recipe "apache2"
include_recipe "apache2::mod_php5"
include_recipe "apache2::mod_rewrite"

# Setup php
include_recipe "php"
include_recipe "php::module_curl"
include_recipe "php::module_mysql"

# Tools
include_recipe "imagemagick"
include_recipe "openssl"


