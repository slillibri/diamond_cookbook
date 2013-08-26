def whyrun_supported?
    true
end

action :create do
    if @current_resource.exist
        Chef::Log.info("#{@new_resource} already exists - nothing to do")
    else
        converge_by("Create #{@new_resource}") do
            create_collector
        end
    end
end

action :delete do
    if @current_resource.exist
        converge_by("Delete #{@new_resource}") do
            delete_collector
        end
    else
        Chef::Log.info("#{@new_resource} doesn't exist - nothing to delete")
    end
end

def load_current_resource
    @current_resource = Chef::Resource::DiamondCollector.new(new_resource.name)
    @current_resource.enabled(new_resource.enabled)
    @current_resource.snmp(new_resource.snmp)
    @current_resource.interval(new_resource.interval)
    @current_resource.splay(new_resource.splay)
    @current_resource.params(new_resource.params)
end

def create_collector
    template "/etc/diamond/collectors/#{@new_resource.name}.conf" do
        source "collector.erb"
        owner "root"
        group "root"
        variables ({
            :name => new_resource.name,
            :enabled => new_resource.enabled,
            :interval => new_resource.interval,
            :snmp => new_resource.snmp,
            :splay => new_resource.splay,
            :params => new_resource.params
        })
        mode 00644
        notifies :restart, "service[diamond]"
    end    
end

def delete_collector
    file "/etc/diamond/collectors/#{@new_resource.name}.conf" do
        action :delete
        notifies :restart, "service[diamond]"
    end
end
