#
# Cookbook Name:: load-balancer
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'nginx'
backends = search(:node, 'role:backend_role',
        :filter_result => { 'fqdn' => ['fqdn'],
                            'port' => ['nginx', 'port']})

ruby_block 'edit_config_server' do
    block do
        file = Chef::Util::FileEdit.new('/etc/nginx/sites-enabled/000-default')
        file.search_file_delete_line(/\sroot/)
        file.insert_line_after_match(/index/, "proxy_pass http://default;")
        file.write_file
    end
end

template '/etc/nginx/conf.d/default.conf' do
    source 'balance_fqdn.erb'
    mode '0755'
    variables( serv: backends )
    verify 'nginx -t'
    notifies :restart, 'service[nginx]'
end

service 'nginx' do
    supports :reload => true, :restart => true
    action [:reload, :restart]
end
