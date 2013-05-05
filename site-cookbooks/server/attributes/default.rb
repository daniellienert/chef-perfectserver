## Additional Cookbook attributes

# phpmyadmin
default['phpmyadmin']['server_name'] = node[:fqdn]
default['phpmyadmin']['server_aliases'] = ['phpmyadmin.*.*']

# roundcube
default['roundcube']['host'] = node[:fqdn]