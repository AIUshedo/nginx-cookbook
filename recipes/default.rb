#
# Cookbook:: uber_nginx_cookbook
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.
package "nginx"

service 'nginx' do
  action :enable
end

service 'nginx' do
  action :start
end

template "/etc/nginx/nginx.conf" do
  source "nginx.conf.erb"
  variables proxy_port: node["nginx"]["proxy_port"]
  notifies :restart, "service[nginx]"
end
