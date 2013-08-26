# Install the http collector config

include_recipe 'diamond::default'

dimond_collector "HttpdCollector" do
    enabled true
    path         node[:diamond][:collectors][:HttpdCollector][:path]
    url          node[:diamond][:collectors][:HttpdCollector][:url]
end

