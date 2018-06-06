# # encoding: utf-8

# Inspec test for recipe oracle_weblogic::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

file_path = "C:\\oracle\\product\\infra_12.2.1.3.0\\inventory\\registry.xml"
describe file(file_path) do
  its('content') {should match /<distribution status="installed" name="WebLogic Server for FMW" version="12.2.1.3.0">/}
end
