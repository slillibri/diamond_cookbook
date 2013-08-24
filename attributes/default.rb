default["diamond"]["install_method"] = "package"
default["diamond"]["graphite_server_role"] = nil
default["diamond"]["graphite_server"] = "graphite"
default["diamond"]["path_prefix"] = "servers"
default["diamond"]["interval"] = "60"
default["diamond"]["handlers"] = "diamond.handler.graphite.GraphiteHandler, diamond.handler.archive.ArchiveHandler"
case node[:platform]
  when "ubuntu","debian"
    default[:diamond][:version] = '3.3.568'
  else
    default[:diamond][:version] = '3.0.2-0'
end
