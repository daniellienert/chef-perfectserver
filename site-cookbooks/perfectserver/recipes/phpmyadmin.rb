

template "#{node['apache']['dir']}/sites-available/phpmyadmin.conf" do
  source "web_app/phpmyadmin.conf.rb"
  variables({
      :server_name => node['phpmyadmin']['server_name'],
      :server_aliases => node['phpmyadmin']['server_aliases'],
      :docroot => node['phpmyadmin']['home'],
      :upload_dir => node['phpmyadmin']['upload_dir']
  })
  owner 'root'
  group 'root'
  mode 0600
end

apache_site "phpmyadmin.conf" do
  enable site_enabled
end