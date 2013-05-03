#
# Cookbook Name:: server
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


include_recipe 'ohai'


# Enable apt-get package
chef.add_recipe "apt"

# Setup databases
chef.add_recipe "mysql"
chef.add_recipe "mysql::server"
chef.add_recipe "database::mysql"

# Setup apache
chef.add_recipe "apache2"
chef.add_recipe "apache2::mod_php5"
chef.add_recipe "apache2::mod_rewrite"

# Setup php
chef.add_recipe "php"
chef.add_recipe "php::module_curl"
chef.add_recipe "php::module_mysql"

# Tools
chef.add_recipe "imagemagick"
chef.add_recipe "openssl"


