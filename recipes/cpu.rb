# Install the cpu collector config

include_recipe 'diamond::default'

diamond_collector "CPUCollector" do
    enabled true
    interval 60
end
