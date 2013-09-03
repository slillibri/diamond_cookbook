# Install the haproxy collector config

include_recipe 'diamond::default'

#load the data bag
databag = Chef::EncryptedDataBagItem.load("passwords", "haproxy")
haproxy_params = node[:diamond][:collectors][:HAProxyCollector].merge(stats_user: databag['standard']['stats_user'], stats_pass: databag['standard']['stats_pass'])

diamond_collector "HAProxyCollector" do
    enabled true
    params haproxy_params
end
