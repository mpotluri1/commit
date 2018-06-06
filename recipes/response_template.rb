template "#{Chef::Config[:file_cache_path]}/wls_response.rsp" do
  source 'wls_response.erb'
  owner 'Administrator'
end
