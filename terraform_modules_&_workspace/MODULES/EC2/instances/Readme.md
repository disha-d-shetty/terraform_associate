# this is a dedicated file for this module EC2/instances

This module has simple ec2 instance configuration:
1. variables:
    - "instance_ami" (string) --> defines ami id for the provider region & OS
    - "instance_type" (string) --> defines the type of isntance required based on CPU/memory
    - "subnet_id" (string) --> defines the subnet where the resource should be deployed
    - "tags" (map(string)) --> the tags added to resource
2. monitoring is always enabled
3. outputs:
- you can use instance id created by referncing the output variable --> "instance_id"
