# Install the disk space collector config

include_recipe 'diamond::default'

diamond_collector "DiskUsageCollector" do
    enabled true
end
