include_recipe 'sensu_spec'

sensu_spec "logstash-forwarder config" do
  command "check_cmd -c 'test -r #{node['logstash_forwarder']['config_file']}' -e 0"
end

sensu_spec "logstash-forwarder process" do
  command "check_procs -C logstash-forwar -c 1:1"
end
