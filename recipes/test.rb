#
# Cookbook Name:: logstash_forwarder
# Recipe:: test
#
# Copyright (C) 2014 zeroXten
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

%w[ test.crt test.key test.ca ].each do |file|
  cookbook_file "#{Chef::Config[:file_cache_path]}/#{file}" do
    owner 'root'
    group 'root'
    mode 0644
  end
end

node.normal['logstash_forwarder']['config']['network']['ssl certificate'] = "#{Chef::Config[:file_cache_path]}/test.crt"
node.normal['logstash_forwarder']['config']['network']['ssl key'] = "#{Chef::Config[:file_cache_path]}/test.key"
node.normal['logstash_forwarder']['config']['network']['ssl ca'] = "#{Chef::Config[:file_cache_path]}/test.ca"

include_recipe 'logstash_forwarder::default'
