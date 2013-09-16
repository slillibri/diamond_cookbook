# Install the varnish collector config

include_recipe 'diamond::default'

diamond_collector "VarnishCollector" do
    enabled true
    params node[:diamond][:collectors][:VarnishCollector]
end
