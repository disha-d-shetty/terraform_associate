Link - https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/latest 
- Why modules -
    - same code need not be present on every folder/team
    - have standarised code from devops team as module, then teams can alter them acc to need.

Terminology ::
- MODULE/EC2/instance or MODULE/EC2/in-built are called "child modules"
- module "customised_eip" these are called "root modules"
Folder related learning::

1. to use in built modules, u need to have git installed.

2. all the in built modules arent that simple, might as well need some user input. On plan/apply you shall see the necessary user arguments to pass(eg - EKS module). SO always go through github documentations.
    - for aws - use terraform-aws-modules or partner ones.

3. skeleton for custom modules - main_module --> sub_module --> main.tf, readme.md, versions.tf, variables.tf, output.tf

4. to reference the main std code/inbuilt modules & version either in local_path/github/s3, use the appropriate source directories. 
Refer - https://developer.hashicorp.com/terraform/language/modules/sources 

5. when u are referencing the customised/in built module code, you should use local_path as the source calling method.

6. while writting modules, challenges:

- the values like ami/ids should not be hardcoded
- provider's region should not be written
- use required_provider block, so that the user is aware of the provider's version restriction.
- write variables.tf, not values
- use module outputs values, so referenced(module.module_name.output_name) code calls works (eg - eip.instance in referenced_by_TeamA)


7. Multiple provider configuration 
not clear --------------------------------------------------------------------
- if there is a need for resources to be deployed in 2 regions with one terraform apply by the TeamA, then use alias provider.
- where should it be defined?
    - in versions.tf in "child module"
    - in the resource in "child module" (string formatted)
    - in the particular module in "root module" (map formatted - can pass multiple providers for a resource)
    - in provider.tf in "root module" folder (define the alias)
Refer eip.tf in referenced_by_TeamA

8. Requirements to publish ur module on terraform:
- public github repo
- naming convenion [terraform-provider-name]
- repo description 
- x.y.z tags for version
- std module structure : 
    can be of 2 types
    1. minimal module tree structure:
        - Readme.md
        - main.tf
        - variable.tf
        - output.tf
    2. complete module tree structure:
        - Readme.md
        - main.tf
        - variable.tf
        - output.tf
        - modules
            - sub module 1
                - Readme.md
                - main.tf
                - variable.tf
                - output.tf
            - sub module 2
                - Readme.md
                - main.tf
                - variable.tf
                - output.tf
        - examples
            - example 1
                - main.tf

9. terraform workspace 

- you can have different isolated environments. The same code can be running in differnent workspace and can have its own .tfstate.
- Based on workspaces also you can have conditional code.
- when you create a workspace, you ll see another folder in the working directory called - "terraform.tfstate.d" - u ll find your tfstae and lock file there
- Refer terraform_modules_&_workspace\MODULES\EC2\instances\main.tf
- terraform workspace list
- terraform workspace select workspace_name
- terraform workspace new workspace_name