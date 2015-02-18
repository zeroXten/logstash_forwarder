default.logstash_forwarder.version = '0.3.1'
default.logstash_forwarder.enable_spec = true
default.logstash_forwarder.config_file = '/etc/logstash-forwarder'
default.logstash_forwarder.user = 'root'
default.logstash_forwarder.group = 'root'
default.logstash_forwarder.config.network.servers = [ 'localhost:5043' ]
default.logstash_forwarder.config.files.default = { 'paths' => { '/var/log/messages' => true, '/var/log/*.log' => true, '/var/log/secure' => true }, 'fields' => { 'type' => 'syslog' } }
default.logstash_forwarder.fd_limit = 1024

