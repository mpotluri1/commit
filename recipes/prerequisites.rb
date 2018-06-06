java_file = "#{Chef::Config[:file_cache_path]}/#{node['oracle_weblogic']['java_file']}"
s3_file java_file do
  remote_path  "#{node['oracle_weblogic']['java_s3_folder']}/#{node['oracle_weblogic']['java_file']}"
  bucket       node['oracle_weblogic']['s3_bucket']
  aws_region   node['oracle_weblogic']['s3_region']
  action :create
  not_if { File.exist?("#{Chef::Config[:file_cache_path]}/#{node['oracle_weblogic']['java_file']}") }
end

powershell_script 'Install JDK' do
  code <<-EOH
  # create java home folder
  mkdir "c:\\java\\jdk1.8.162" -ErrorAction SilentlyContinue
  # install java
  iex "C:/Users/Administrator/AppData/Local/Temp/kitchen/cache/jdk-8u162-windows-x64.exe /s INSTALLDIR=c:\\java\\jdk1.8.162"
  EOH
end