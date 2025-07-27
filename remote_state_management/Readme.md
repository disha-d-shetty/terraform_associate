Folder related learning::

1. never store .tfstate file -
why?
- consider the password file/value is not under git directory, yet once u have the .tfstate, it ll contain all sensitive datas, so dont store it.

2. files to ignore (.gitignore)
- .terraform
- .tfvars (can contain sensitive values)
- .tfstate (should be in remote side, can contain sensitive data)
- crash.log (if terraform crashes, then the logs are stored here)
- DONT ignore .lock.hcl file !!

3. "backend" -

- this is where you define where to store the state file
- always have a centralised encrypted place like s3/azurerm(1st authenticate and then use) to store state files
- if "backend" is not defined, then .tfstate file is generated in the working local directory by default.
- check for state locking (stop macking changes to the state file), not all backeneds support it
Recommended architecture 
    - .tf code inside git repository
    - .tfstate files inside central backend. So that every one can collaborate
Link - https://developer.hashicorp.com/terraform/language/backend

4. state-locking -

- to avoid concurrent changes at same time to state file.
- how to enable? 
    - check for backend, depends on the type of storage used. Read the documents.
- .dev(terraform).tfstate.lock.info is created when state file is altered by plan/apply cmds. You can also ewho is the applying the changes in that file.
- this file is erased off, once the plan.apply cmd is completed.
- .terraform.lock.hcl this is a lock file for provider configuration only! this and state lock is not the same.
- in case, automatic unlocking doesnt happen as expected on local, then use terraform force-unlock Lock_id cmd.
- Always makes sure that state locking is always supported!!!!!!!

5. state managements commands -

- terraform state show resource_name.local_name - displays attributes related to it
- terrform state list - list all the state resources. Run it under the working directory
- terrform state pull - when remote backend it used, then use this. DONT DOWNLOAD the file!!
- terraform state rm resource.local 
    - if the resource is been modified manually, so you dont want to manage it by terraform, then use it.
    - if you remove the code, then the resource will be deleted, so use rm, to remove from terraform, but not delete it
- terrform state mv resource.local_name1 resorce.local_name2
    - if the resource local name to be changed, then use this. change the .tf file code after mv cmd.
- terrform state replace-provider current_provider new_provider
    - when u want to use the company provider only suddenly

6. cross project collaboration[terraform_remote_state] - 

- project A wants project B's outputs/results to function. Eg - Security team needs network team outputs. And they have isolated tf folders to manage, this is when we use cross project collaboration.
- Here the state file is stored remotely, as per industry standards. This fetching of outputs of one state file is refered as "remote state data source".
- how to use?
    - "terraform_remote_state" data block usage
    - to reference this data block on the resources use - "data.terraform_remote_state.terrform_remote_state_name.outputs.output_name"

7. terrform import -

- if u have manually created resource, and you want to manage it through terraform, then use this
- what does it do? 
    - it updates the state file with manually created resource
    - it create configuration tf code files too automatically (from terraform version 1.5 ONLY!)
- Use import block to get the details of the resource created
- use " terraform plan -generate-config-out="resource.tf" " to get a configuration tf file created.
- use terraform apply, to make use state file is updated with this resource.
