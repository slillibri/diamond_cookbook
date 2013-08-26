# Install the mongo collector config

include_recipe 'diamond::default'

package "pymongo" do
  if platform?("debian", "ubuntu")
    package_name "python-pymongo"
  end
  action :install
end

diamond_collector "MongoDBCollector" do
    enabled true
    path  node[:diamond][:collectors][:MongoDBCollector][:path]
    host  node[:diamond][:collectors][:MongoDBCollector][:host]
end
