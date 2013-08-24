#
# Cookbook Name:: diamond
# Recipe:: default
#



service "diamond" do
  action [ :nothing ]
end

include_recipe "diamond::install_%s" % [node.default['diamond']['install_method']]

service "diamond" do
  action [ :enable ]
end

if node.default['diamond']['graphite_server_role'].nil?
  graphite_ip = node.default['diamond']['graphite_server']
else
  if Chef::Config[:solo]
    Chef::Log.warn("This recipe uses search. If using solo, set node['diamond']['graphite_server'].")
  else
    graphite_nodes = search(:node, "role:%s" % [node.default['diamond']['graphite_server_role']])
    if graphite_nodes.empty?
      Chef::Log.warn("No nodes returned from search")
      graphite_ip = node.default['diamond']['graphite_server']
    else
      graphite_ip = graphite_nodes[0]["ipaddress"]
    end
  end
end

template "/etc/diamond/diamond.conf" do
  source "diamond.conf.erb"
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, resources(:service => "diamond")
  variables(
    :graphite_ip => graphite_ip
  )
end
