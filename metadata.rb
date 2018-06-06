name 'Windows_Oracle_Weblogic'
maintainer 'REAN Cloud'
maintainer_email 'manvitha.potluri@reancloud.com'
license 'All Rights Reserved'
description 'Installs/Configures oracle_weblogic'
long_description 'Installs/Configures oracle_weblogic'
version '0.1.0'
chef_version '>= 12.14' if respond_to?(:chef_version)

supports 'windows'

depends 's3_file', '2.8.1'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/oracle_weblogic/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/oracle_weblogic'
