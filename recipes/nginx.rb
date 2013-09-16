# Install the nginx collector config

include_recipe 'diamond::default'

diamond_collector "NginxCollector" do
    enabled true
    params node[:diamond][:collectors][:NginxCollector]
end

