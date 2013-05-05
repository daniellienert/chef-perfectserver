service "fail2ban" do
  supports [ :status => true, :restart => true ]
  action [ :enable, :start ]
end

template "/etc/fail2ban/jail.local" do
  source "fail2ban/jail.conf.erb"
  owner "root"
  group "root"
  mode 0400
  notifies :restart, "service[fail2ban]"
end
