# encoding: utf-8
# Copyright (c) 2017 REAN Cloud (https://www.reancloud.com) All rights reserved

wls_file = "#{Chef::Config[:file_cache_path]}/#{node['oracle_weblogic']['wls_file']}"
s3_file wls_file do
  remote_path  "#{node['oracle_weblogic']['wls_s3_folder']}/#{node['oracle_weblogic']['wls_file']}"
  bucket       node['oracle_weblogic']['s3_bucket']
  aws_region   node['oracle_weblogic']['s3_region']
  action :create
  not_if { File.exist?("#{Chef::Config[:file_cache_path]}/#{node['oracle_weblogic']['wls_file']}") }
end

wls_rsp_file = "#{Chef::Config[:file_cache_path]}/#{node['oracle_weblogic']['wls_rsp_file']}"
s3_file wls_rsp_file do
  remote_path  "#{node['oracle_weblogic']['wls_s3_folder']}/#{node['oracle_weblogic']['wls_rsp_file']}"
  bucket       node['oracle_weblogic']['s3_bucket']
  aws_region   node['oracle_weblogic']['s3_region']
  action :create
  not_if { File.exist?("#{Chef::Config[:file_cache_path]}/#{node['oracle_weblogic']['wls_rsp_file']}") }
end

powershell_script 'Install Oracle Weblogic Server' do
  guard_interpreter :powershell_script
  code 'C:\\java\\jdk1.8.162\\bin\\java.exe -Xmx2560m -jar C:\\Users\\Administrator\\AppData\\Local\\Temp\\kitchen\\cache\\fmw_12.2.1.3.0_infrastructure.jar -silent -responseFile C:\\Users\\Administrator\\AppData\\Local\\Temp\\kitchen\\cache\\wls_response.rsp'
end
