actions :create, :delete
default_action :create

attribute :name, :kind_of => String, :name_attribute => true
attribute :enabled, :kind_of => [TrueClass, FalseClass], :default => false
attribute :snmp, :kind_of => [TrueClass, FalseClass], :default => false
attribute :interval, :kind_of => Fixnum, :default => 300
attribute :splay, :kind_of => Fixnum, :default => 0

attribute :params, :kind_of => Hash, :default => {}

attr_accessor :exist
