node.default['diamond']['install_method'] = 'package'
node.default['diamond']['graphite_server_role'] = nil
node.default['diamond']['graphite_server'] = 'graphite'
node.default['diamond']['path_prefix'] = 'servers'
node.default['diamond']['interval'] = '60'
node.default['diamond']['handlers'] = 'diamond.handler.graphite.GraphiteHandler, diamond.handler.archive.ArchiveHandler'
case node.default['platform']
  when 'ubuntu','debian'
    node.default['diamond']['version'] = '3.3.568'
  else
    node.default['diamond']['version'] = '3.0.2-0'
end
