# Install the nfs collector config
include_recipe 'diamond::default'

diamond_collector "NFSServerCollector" do
    enabled true
    params    node[:diamond][:collectors][:NFSServerCollector]
end
