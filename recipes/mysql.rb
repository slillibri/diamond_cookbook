# Install the mysql collector config

include_recipe 'diamond::default'

#load data bag
mysql = Chef::EncryptedDataBagItem.load("passwords", "mysql")
mysql_params = node[:diamond][:collectors][:MySQLCollector].merge(user: mysql['username'], passwd: mysql['password'])

diamond_collector "MySQLCollector" do
    enabled true
    params mysql_params
end

