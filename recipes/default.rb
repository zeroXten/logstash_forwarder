#
# Cookbook Name:: logstash_forwarder
# Recipe:: default
#
# Copyright (C) 2014 Burberry, LTD
# 
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
# 
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

include_recipe 'logstash_forwarder::sensu_spec'

case node['platform_family']
when 'debian'
  file = "logstash-forwarder_#{node['logstash_forwarder']['version']}_amd64.deb"

  cookbook_file "#{Chef::Config[:file_cache_path]}/#{file}" do
    owner "root"
    group "root"
    mode 0644
  end

  dpkg_package "#{file}" do
    source "#{Chef::Config[:file_cache_path]}/#{file}"
    notifies :restart, 'service[logstash-forwarder]'
  end

when 'rhel'
  file = "logstash-forwarder-#{node['logstash_forwarder']['version']}-1.x86_64.rpm"

  cookbook_file "#{Chef::Config[:file_cache_path]}/#{file}" do
    owner "root"
    group "root"
    mode 0644
  end

  rpm_package "#{file}" do
    source "#{Chef::Config[:file_cache_path]}/#{file}"
    notifies :restart, 'service[logstash-forwarder]'
  end

  cookbook_file '/etc/init.d/logstash-forwarder' do
    owner 'root'
    group 'root'
    mode 0755
    source 'logstash-forwarder-init-rhel'
    notifies :restart, 'service[logstash-forwarder]'
  end
end

require 'json'

file node['logstash_forwarder']['config_file'] do
  owner node['logstash_forwarder']['user']
  group node['logstash_forwarder']['group']
  mode 0644
  content JSON.pretty_generate(node['logstash_forwarder']['config'])
  notifies :restart, 'service[logstash-forwarder]'
end

service 'logstash-forwarder' do
  supports :status => true, :restart => true
  action [ :enable, :start ]
end


