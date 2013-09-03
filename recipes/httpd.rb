# Install the http collector config

include_recipe 'diamond::default'

dimond_collector "HttpdCollector" do
    enabled true
    params node[:diamond][:collectors][:HttpdCollector]
end

