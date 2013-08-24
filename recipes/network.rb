# Install the network collector config

include_recipe 'diamond::default'

collector_config "NetworkCollector" do
  interfaces node[:diamond][:collectors][:NetworkCollector][:interfaces]
  byte_unit node[:diamond][:collectors][:NetworkCollector][:byte_unit]
  if node[:diamond][:collectors][:NetworkCollector][:interval]
    interval node[:diamond][:collectors][:NetworkCollector][:interval]
  end
end

