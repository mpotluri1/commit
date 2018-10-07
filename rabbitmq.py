#!/usr/bin/env python
#import argparse
import yaml
import boto3

#parser = argparse.ArgumentParser(description='This is a demo script')
#parser.add_argument('-u','--username', help='rabbitmq username',required=True)
#parser.add_argument('-p','--password',help='rabbitmq password', required=True)
#parser.add_argument('-r','--region', help='AWS Region for Parameter', required=True)
#args = parser.parse_args()

ssm = boto3.client('ssm')
password = ssm.get_parameters(
  Names=[
    'rabbitmq_pass',
  ],
  WithDecryption = True
)
username = ssm.get_parameters(
  Names=[
    'rabbitmq_username',
  ],
  WithDecryption = True
)

password = str(password['Parameters'][0]['Value'])
username = str(username['Parameters'][0]['Value'])

data = dict(
    init_config = "",
    instances = dict(
        rabbitmq_api_url = 'http://localhost:15672/api/',
        rabbitmq_user = username,
        rabbitmq_pass = password
    )
)

with open('/etc/datadog-agent/conf.d/rabbitmq.d/conf.yaml', 'w') as outfile:
    yaml.dump(data, outfile, default_flow_style=False)
