default['logstash_forwarder']['version'] = '0.3.1'
default['logstash_forwarder']['config_file'] = '/etc/logstash-forwarder'
default['logstash_forwarder']['user'] = 'root'
default['logstash_forwarder']['group'] = 'root'
default['logstash_forwarder']['config']['network']['servers'] = [ 'localhost:5043' ]
default['logstash_forwarder']['config']['files'] = [ { "paths" => [ "/var/log/messages", "/var/log/*.log" ], "fields" => { "type" => "syslog" } } ]
