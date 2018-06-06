#
# Cookbook:: windows_oracle_weblogic
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe 'Windows_Oracle_Weblogic::prerequisites'
include_recipe 'Windows_Oracle_Weblogic::response_template'
include_recipe 'Windows_Oracle_Weblogic::wls_install'
