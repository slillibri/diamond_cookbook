# Install the network collector config

include_recipe 'diamond::default'
network_params = node[:diamond][:collectors][:NetworkCollector]

diamond_collector "NetworkCollector" do
    enabled true
    interval 10
    params network_params
end
