# Install the memory collector config

include_recipe 'diamond::default'

diamond_collector "MemoryCollector" do
    enabled true
end
