# Install the mysql collector config

include_recipe 'diamond::default'

#load data bag
mysql = Chef::EncryptedDataBagItem.load("passwords", "mysql")

diamond_collector "MySQLCollector" do
    enabled true
    path    node[:diamond][:collectors][:MySQLCollector][:path]
    host    node[:diamond][:collectors][:MySQLCollector][:host]
    port    node[:diamond][:collectors][:MySQLCollector][:port]
    db      node[:diamond][:collectors][:MySQLCollector][:db]
    user    mysql['username']
    passwd  mysql['password']
end

