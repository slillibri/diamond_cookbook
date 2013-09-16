# Install netscaler collector config

include_recipe 'diamond::default'

#load databag
databag = Chef::EncryptedDataBagItem.load("passwords", "snmp")
netscaler_params = node[:diamond][:collectors][:NetscalerSNMPCollector].merge(community: databag['community'])

diamond_collector "NetscalerSNMPCollector" do
    enabled true
    snmp      true
    params netscaler_params
    only_if node[:diamond][:snmp] == "true"
end 
