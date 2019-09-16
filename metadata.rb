name             'solr-lts'
maintainer       'Stephen Sadowski'
maintainer_email 'stephen.sadowski@sjsadowski.com'
license          'MIT'
description      'Installs the solr search engine.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.7.0'
chef_version     '>= 14.0'

supports 'centos', '>= 7.0'
supports 'redhat', '>= 7.0'
supports 'scientific', '>= 7.0'

supports 'amazon', '>= 2.0'

supports 'debian', '>= 8.0'
supports 'ubuntu', '>= 16.04'

depends 'tar'
depends 'java'
depends 'systemd'

source_url 'https://github.com/sjsadowski/chef-solr-lts' if respond_to?(:source_url)
issues_url 'https://github.com/dwradcliffe/chef-solr-lts/issues' if respond_to?(:issues_url)
