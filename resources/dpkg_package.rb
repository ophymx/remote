actions :install
default_action :install if defined?(default_action)

def initialize(*args)
  super
  @action = :install
end

attribute :name, kind_of: String, name_attribute: true
attribute :url, kind_of: String
attribute :checksum, kind_of: String
