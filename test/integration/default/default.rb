describe file('/etc/init.d/solr') do
  it { should exist }
end

describe service('solr') do
  it { should be_enabled }
  it { should be_running }
end

describe port(8983) do
  it { should be_listening }
end
