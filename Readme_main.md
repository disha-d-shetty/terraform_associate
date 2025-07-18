why needed IAC?

    1. infra creation[hardened code][repeatable work] in different env
    2. low risk of human error
    3. version control[by pushing to github] and easy collab with teams

IAC can be divided into:

    ---> configuration management tool(tweek used inside servers, EG: Ansible, chef). Allows creation of  infra [not preferred].
    ---> Infrastruction orchestration tool( raw infra env creation, EG: Tf, cloudformation).

which IAC tool to choose?

    1. Requirement of organisation - Use case 1
        1. vendor specific longer term usage  (AWS - then cloudformation)
        2. official support needed when team runs to issues
        3. GUI integration needed
    2. Requirement of organisation - Use case 2 - Terraform
        1. Hybrid solution(cloud + on prem) 
        2. official support needed - Hasicorp supports

Commands::

    1. terraform init
    2. terraform plan
    3. terraform apply
    4. terraform destroy
    5. terraform destroy -target resource_type.local_resource_name
    6. terraform refresh [deprecated]
    7. terraform init -upgrade
    8. terraform apply -auto-approve
    9. terraform -refresh-only [latest cmd]
    10. terraform plan -var-file="*.tfvars"
    11. terraform plan -var="variable_name=value"
    12. terraform console  - exit ctrl+D
    13. terraform validate - for syntax
    14. set TF_LOG=INFO [windows cmd] 
    15. export TF_LOG=INFO [linux terminal]
    16. terraform fmt
    17. terraform apply -replace="resouce_name.local_name
    18. terraform graph
    19. terraform plan -out="name.plan"
    20. terraform show name.plan
    21. terraform output variable_name
    22. terrfaorm version
    23. terraform plan -target="resource_name.local_name"
    24. terraform workspace list
    25. terraform workspace select workspace_name
    26. terraform workspace new workspace_name
    27. 

Note::

    If u see issue/bugs in the resources/providers, report it under the github page
    link for terraform/aws- https://github.com/hashicorp/terraform-provider-aws/issues 
    link for terraform core code - https://github.com/hashicorp/terraform 




