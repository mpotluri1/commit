# rean-chef-weblogic12c-windows

Installs weblogic 12c on windows 2012 R2 server

## WebLogic Chef Support for

- The installation of WebLogic 12c

- WebLogic version 12.2.1.3.0

- jdk 1.8.162

- Windows 2012 R2

## chef-weblogic cookbook overview

Recipes :
> prerequisites : Downloads and installs java jdk
> response_template: Downloads response file
> wls_install: Installs weblogic

## Configuration attributes

Below Configuration attributes are defined to configure weblogic installation.
* default['oracle_weblogic']['s3_bucket']
* default['oracle_weblogic']['java_s3_folder']
* default['oracle_weblogic']['wls_s3_folder']
* default['oracle_weblogic']['s3_region']
* default['oracle_weblogic']['java_file']
* default['oracle_weblogic']['wls_file']

## Test Cookbook

This cookbook has inspec specific to Weblogic installation . Installation can be verified running inspecs. It checks for the installed weblogic version.

