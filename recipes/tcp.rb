# Install the TCP collector config

include_recipe 'diamond::default'

diamond_collector "TCPCollector" do
    enabled true
    params node[:diamond][:collectors][:TCPCollector]
end

