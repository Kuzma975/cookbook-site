#
# Cookbook Name:: server
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
include_recipe 'nginx'

directory node['nginx']['default_root'] do
    mode '0755'
    action :create
end

template "#{node['nginx']['default_root']}/index.html" do
    source 'default/default.erb'
    mode '0755'
end
