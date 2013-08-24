# Install netscaler collector config

include_recipe 'diamond::default'

#load databag
databag = Chef::EncryptedDataBagItem.load("passwords", "snmp")

if node.default['diamond']['snmp'] == "true"
  collector_config "NetscalerSNMPCollector" do
    path      node.default['diamond']['collectors']['NetscalerSNMPCollector']['path']
    snmp      true
    interval  node.default['diamond']['collectors']['NetscalerSNMPCollector']['interval']
    timeout   node.default['diamond']['collectors']['NetscalerSNMPCollector']['timeout']
    retries   node.default['diamond']['collectors']['NetscalerSNMPCollector']['retries']
    port      node.default['diamond']['collectors']['NetscalerSNMPCollector']['port']
    community databag['community']
    devices   node.default['diamond']['collectors']['NetscalerSNMPCollector']['devices']
  end 
end 

