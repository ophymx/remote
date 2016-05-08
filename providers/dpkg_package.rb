require 'uri'

use_inline_resources if defined?(use_inline_resources)

def whyrun_supported?
  true
end

action :install do
  pkg_file = ::File.basename(URI(new_resource.url).path)

  remote_file "#{Chef::Config[:file_cache_path]}/#{pkg_file}" do
    source new_resource.url
    mode 0644
    checksum new_resource.checksum
  end

  dpkg_package new_resource.name do
    source "#{Chef::Config[:file_cache_path]}/#{pkg_file}"
    action :install
  end
end
