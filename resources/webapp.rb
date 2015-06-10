actions :deploy

attribute :name, :kind_of => String, :name_attribute => true
attribute :cwd, :kind_of => String, :default => nil
attribute :trial, :kind_of => [ TrueClass, FalseClass ], :default => false
attribute :skip_database_provider, :kind_of => [ TrueClass, FalseClass ], :default => false
attribute :skip_web_configs, :equal_to => [:none,
										   :root,
										   :all], :default => :none

def initialize(name, run_context=nil)
  super
  @action = :deploy
end