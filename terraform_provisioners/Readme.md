Folder related learning::

Provisioner? -
- used to execute scripts on local/remote machine as a part of creation/destruction of resource.
- eg: install software after vm is spinned up
- Link - https://developer.hashicorp.com/terraform/language/resources/provisioners/local-exec 
- multiple provisioners in same resource block is allowed
- creation time provisioners
    - default type of provisioners
    - runs only 1st time
    - on updation of arguments in resource, wont run the provisioners again
- destroy time provisioners 
    - runs only at the destruction of resource
    - use "when = destroy". Refer local-exec.tf
    - use case - when de link of anti virus software
- Types available on hashicorp :
    - file
    - remote-exec
        - invokes script/task in remote server/resource, after resource is created
        - .pem should be in folder
    - local-exec 
        - invokes local executable task after remote resource is created
        - the script is executed on the local machine, where terraform is running
- if the provisioner fails to get completed on 1st run, then the resource is marked as tainted. On 2nd apply cmd, resource gets deleted and re created
- failure settings(on_failure) -
    - default behaviour - if provisioner failed to create, resource is tainted
    - continue - if provisioner failed to create, resource is created successfully. Refer - local-exec.tf 