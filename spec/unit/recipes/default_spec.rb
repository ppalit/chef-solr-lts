require 'spec_helper'

describe 'solr::default' do
  # let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04', step_into: ['ark']).converge(described_recipe) }

  it 'includes the java recipe' do
    expect(chef_run).to include_recipe('java')
  end

  it 'creates the init script' do
    expect(chef_run).to create_template('/etc/init.d/solr')
  end

  it 'enables the service' do
    expect(chef_run).to enable_service('solr')
  end

  it 'starts the service' do
    expect(chef_run).to start_service('solr')
  end

  context 'centos' do
    # let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'centos', version: '7.0', step_into: ['ark']).converge(described_recipe) }

    it 'renders the start script' do
      expect(chef_run).to create_template('/var/lib/solr.start')
    end
  end

  context 'no java' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04') do |node, _server|
        node.normal['solr']['install_java'] = false
      end.converge(described_recipe)
    end

    it 'should not include the java recipe' do
      expect(chef_run).to_not include_recipe('java')
    end
  end
end
