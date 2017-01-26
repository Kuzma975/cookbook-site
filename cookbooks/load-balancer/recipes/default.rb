#
# Cookbook Name:: load-balancer
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'nginx'

service 'nginx' do
    action [:stop]
end

ruby_block 'edit_config_server' do
    block do
        file = Chef::Util::FileEdit.new('/etc/nginx/sites-enabled/000-default')
        file.search_file_delete_line(/\sroot/)
        file.insert_line_after_match(/index/, "proxy_pass http://default;")
        file.write_file
    end
end

template '/etc/nginx/conf.d/default.conf' do
    source 'default.erb'
    mode '0755'
    verify 'nginx -t'
end

service 'nginx' do
    supports :reload => true, :restart => true
    action [:reload, :restart]
end
