
describe 'logstash-forwarder' do
  describe 'command' do
    it 'must have executable file /opt/logstash-forwarder/bin/logstash-forwarder'
  end

  describe 'config' do
    it "must have readable file #{node['logstash_forwarder']['config_file']}"
  end

  describe 'process' do
    it 'must have 1 logstash-forwar process'
  end
end
