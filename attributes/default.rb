#
# Cookbook Name:: solr
# Attributes:: default
#
# Copyright 2019, Stephen Sadowski
#

default['solr']['version']  = '7.7.2'
default['solr']['url']      = "https://archive.apache.org/dist/lucene/solr/#{node['solr']['version']}/solr-#{node['solr']['version']}.tgz"
default['solr']['data_dir'] = '/etc/default/solr'
default['solr']['dir']      = '/opt/solr'
default['solr']['port']     = '8983'
default['solr']['install_java']    = true
