# Install the network collector config

include_recipe 'diamond::default'

diamond_collector "NetworkCollector" do
    enabled true
    interval 10
    params :interfaces => node[:diamond][:collectors][:NetworkCollector][:interfaces], :byte_unit => node[:diamond][:collectors][:NetworkCollector][:byte_unit]
end
