# Install the load average collector config

include_recipe 'diamond::default'

diamond_collector "LoadAverageCollector" do
    enabled true
end
