# Install the vm stat collector config

include_recipe 'diamond::default'

diamond_collector "VMStatCollector" do
    enabled true
end
