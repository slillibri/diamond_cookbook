# install snmp interface collector config

include_recipe 'diamond::default'

#load databag
databag = Chef::EncryptedDataBagItem.load("passwords", "snmp")
snmp_params = node[:diamond][:collectors][:SNMPInterfaceCollector].merge(community: databag['community'])

diamond_collector "SNMPInterfaceCollector" do
    enabled true
    snmp      true
    params snmp_params
end
