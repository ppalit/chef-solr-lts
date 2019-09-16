# chef-solr-lts [![Build Status](https://travis-ci.org/sjsadowski/chef-solr-lts.png?branch=master)](https://travis-ci.org/sjsadowski/chef-solr-lts)

Installs [solr](http://lucene.apache.org/solr/) and starts the service.

## About

This is a fork of David Radcliffe's [original chef-solr](https://github.com/dwradcliffe/chef-solr/blob/master/LICENSE) cookbook, updated (to some extent) for working with solr in 2019.

There are some pretty big changes:
1. Use install script for solr - this makes sure the correct system initialization
   is used, either init.d or systemd via LSB
2. Setting default solr version to 7.7.2 (LTS as of August 2019)
3. Eliminating the checksum due to ark not supporting sha512 (128bit) checksums
4. Migrated to InSpec for testing

## Support

This cookbook supports Amazon Linux 2, Debian Stretch, Ubuntu Xenial Xerus
Red Hat Linux 7 and the community rebuilds (CentOS, Scientific) and theoretically
later versions of these distributions, however testing is only done on Jessie,
Xenial, and CentOS.

If you encounter an issue, please [submit it](https://github.com/sjsadowski/chef-solr-lts/issues)

## Testing

Testing is done with chef client 14.12.9 to ensure 14.x compatibility

## Recipes

- `default` - This will install java, download solr and setup the service

## Attributes

- `node['solr']['version']` - Version of solr to install.
- `node['solr']['url']` - Url of solr source to download.
- `node['solr']['data_dir']` - Location for solr data and config.
- `node['solr']['dir']` - Location of the solr sorce files.
- `node['solr']['port']` - The port the solr service is bound to.
- `node['solr']['install_java']` - Installs Java via the community cookbook.
  Default `true`.


## License and Author

License: [MIT](https://github.com/sjsadowski/chef-solr/blob/master/LICENSE)

Author: [Stephen Sadowski](https://github.com/sjsadowski)
Original Author: [David Radcliffe](https://github.com/dwradcliffe)

Inspiration for the start script from [https://github.com/jbusby/solr-initd](https://github.com/jbusby/solr-initd)
