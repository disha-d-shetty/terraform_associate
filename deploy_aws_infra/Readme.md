Note::

    providers are 3 tier types (official/partners/community). 
    Use offical/partner only(maintained by Hashicorp/vendor respectively) !!!
    Link - https://registry.terraform.io/browse/providers?tier=official 


Folder related learning::

1. Authentication(user present?) and Autherisation(user has access?) is necessary. Can be token/secrets keys, depends on providers. Store the keys safely!!!

2. terraform init - download provider plugin - stored in .terraform folder

3. new infra object to be created then use - resource block.
    resource "aws_instance(is default)" "my_ec2(need to be unique for different conf. In terraform its stored as aws_instance + my_ec2), so"

4. terraform destroy - u can target the destruction one one resource by specifying variable "target"

5. be careful while "commenting the code" 

- if a part of code/resource is created in 1st run, later its code is commented out, then on 2nd run it is considered as not needed and on terraform apply that resource gets destroyed off!

6. state file(.tfstate) - all the state of resources created is stored here. All live data of resource. Always have backup of this file!

7. desired state & current state 

- need not be equal always(when altered manually). But when terraform apply is done after manual change on resource, terraform ensures that manually changes are reverted back to achieve desired state. Terraform ensures D.S == C.S

8. D.S == C.S - is only applicable for contents specified in the .tf file. 

    Case - always be specify all the necessary values! 

    Eg: 
        - assume "default" SG gets assigned to ur ec2 instance(created from terraform). You ll be able to see the SG associated under state file.
        - now on manual change of the SG on GUI from "default" to "custom" SG, will not affect terraform's desired state.
        - on terraform refresh & plan, u ll see 0 to modify. 
        - Reason - SG was not explicitly specified in the resource block

9. terraform.lock.hcl 

- after doing terraform init with provider version, a lock file with constraint gets created. If you try to alter the version, it wont support.

    Case - what if i want to change the version later? 

    Answer - delete the .lock.hcl file and update version and do terraform init.
                                    OR
             use "terraform init -upgrade" - update provider.tf and use this cmd.

10. Do not use terraform refresh explicitely!!

    Case - changed .tf and ran refresh cmd. statefile changed!

    - Reason - if u refresh, then it ll update state file. so if u change .tf file and hit refresh, then it ll try to check n sync with cloud live infra and update state file.
    - what to do? - terraform plan is good enough to check for D.S == C.S. Its 1st thing is to refresh.