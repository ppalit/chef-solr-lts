# Cookbook Name:: solr-lts
# Recipe:: default
#
# Copyright 2019, Stephen Sadowski
#

# This block is to work around some dating issues and package availability
begin
  # Some red hat distros do not include this by default
  package 'lsof'

  # on debian derivatives, update apt - not doing this can cause
  # java install to fail
  if node['platform_family'] == 'debian'
    execute 'update_apt' do
      command 'apt-get update -y'
    end
  end
end

include_recipe 'java' if node['solr']['install_java']

extract_path = "#{node['solr']['dir']}-#{node['solr']['version']}"
# below is currently unused, may re-use in future
# solr_path = "#{extract_path}/#{node['solr']['version']}"

remote_file "/opt/solr-#{node['solr']['version']}.tgz" do
  source node['solr']['url']
end

tar_extract "#{extract_path}.tgz" do
  action :extract_local
  compress_char 'z'
  target_dir '/opt'
  creates extract_path
end

execute 'install_solr' do
  command "#{extract_path}/bin/install_solr_service.sh #{extract_path}.tgz -p #{node['solr']['port']} -n"
  not_if { File.exist?('/etc/init.d/solr') }
end

service 'solr' do
  action [:enable, :start]
end
