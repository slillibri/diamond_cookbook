# Install the xen collector config

include_recipe 'diamond::default'

diamond_collector "XenCollector" do
    enabled true
    params node[:diamond][:collectors][:XenCollector]
end
