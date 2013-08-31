# Install the disk space collector config

include_recipe 'diamond::default'
disk_parameters = node[:diamond][:collectors][:DiskSpaceCollector]

diamond_collector "DiskSpaceCollector" do
    enabled true
    params disk_parameters
end
