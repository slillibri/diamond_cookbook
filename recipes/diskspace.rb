# Install the disk space collector config

include_recipe 'diamond::default'

diamond_collector "DiskSpaceCollector" do
    enabled true
    filesystems      node[:diamond][:collectors][:DiskSpaceCollector][:filesystems]
    exclude_filters  node[:diamond][:collectors][:DiskSpaceCollector][:exclude_filters]
    byte_unit        node[:diamond][:collectors][:DiskSpaceCollector][:byte_unit]
end
