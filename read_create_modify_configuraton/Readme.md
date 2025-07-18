Folder related learning::

1. always refer the code/documentation based on the version of provider. 

2. attributes - the details of the created resources( like id/IPs ).

3. string interpolation - when u want to concat attributes + string, then use it
( "${attribute}string" )

4. Output values/ Output block 
- it is present in statefile too. You can have it printed on the terminal too. Also you can use "terraform output variable_name" - this extracts value from state file.
- Link - https://developer.hashicorp.com/terraform/language/values/outputs

5. terraform variables - have a centralised place to store configuration variables(Eg - VPC_id)

6. terraform.tfvars/*.tfvars files - 

    why is it used for ?
        - have main.tf -> variable.tf( just for variables name) -> dev/prod/test.tfvars( define the values of the variables )
        - this makes the things look organised
        - same variables can have values based on the env, so this arrangement is right

    terraform.tfvars - default file
                     - overrides the value specified in variables.tf file
                     - no extra command, just terraform plan/apply will work
    *.tfvars - it is not read by default
             - overrides the value specified in variables.tf file
             - terraform plan -var-file="*.tfvars"

7. define values for variable:

    - default in variable.tf file
    - value in .tfvars file
    - cli ( prompt asked to input the undefined variable)
    - setting value in cli (terraform plan/apply -var="VPC_ID=123")
    - environment variable (naming convention should be TF_VAR_variable_name/TF_VAR_VPC_id) [ store the key and value in system environment ] [No extra command needed if the variable is not defined from any of the above methods]

8. variable defination precedence:
    
    -var/-var-file >> *.auto.tfvars/*.auto.tfvars.json >> terraform.tfvars.json >> terraform.tfvars >> environment variables >> default/variable.tf file

9. data type -

- to restrict the value types to allow. The datatype can only be of type mentioned under tf doc
Types:
    - set(string/number) - same as list, but no duplicates(no error if u pass also) and unordered!
        - if elements are re arranged, will not affect.
    - list ["a", 1, "hello"]
        - if elements rearranged, plan is affected
    - list(number) ["1", "2"]
    - map / map(string/number[this is applied to restrict all value's data type])
    - object({key_1 = string, key_2 = number}) 
        - defining variable is same as map
        - but unlike map(number), u can specify different type of values for different elements/keys.
        - If key_3 = type_3 not added as argument, then key_3 is not considered at all.

- you can reference individual elements of them as variable too, eg: var.map_variable[key] / var.list_variable[0]
- Link - https://developer.hashicorp.com/terraform/language/expressions/types 

10. Count - metadata argument, used when pool of identical/same resources needed

Case - create 10 instances same ami and regions
     - make 10 resource blocks with different local name

Instead Use - count = 10 ( local name is internally taken care by terraform)
Refer eip.tf
But 
    - name is not created for them/ same name created as in tags/name - not helpful to identify on GUI (Eg - IAM user. Cant have same names. Error is thrown)
Use - count.index( starts from 0, 1, 2) to have them unique named/tagged. (Eg: payment-0/payment-1 or have list of users names as variables, and iterate through it using count.index)

11. Conditional expression - when this do this, when that do that
Syntax::  CONDITION?True_Value:False_value

12. Functions:
- max()
- file("./file.txt") for reusability in iam_role.tf 
- lookup( map, key, default_value )  
- length(can be map/list/string )
- element(list, index)
- timestamp()
- formatdate(spec, timestamp)
- zipmap([key_list1], [value_list2])  - converts list1(key) & list2(value) into map
- &many more. Link - https://developer.hashicorp.com/terraform/language/functions 
- user defined function is NOT supported!!!!

13. locals block, object local.* - 
why when we have variables? 
- function calls are not supported , so call local.*
- BUT - they cannot be overwritten n all like variables. Need to change the locals.tf
- use Variable, if its not possible use local. 

14. Data source - 
data related to outside of terraform is fetched by this block. Output it/ you ll find it the state file
Link - https://registry.terraform.io/providers/hashicorp/aws/6.0.0/docs/data-sources/ami

15. Logging/verbose levels:
    - trace << debug << info << warn << error ;
    - Use " set TF_LOG" to set verbosity of the log & Stored  the logs and push it to the path env variable "TF_LOG_PATH" ;
    - set variables are temporary only ; Use command prompt ;
    - Link - https://developer.hashicorp.com/terraform/internals/debugging 

16. terraform formatting - terraform fmt; helps to keep the indentations correct

17. Dynamic block - 
- repeatative + small change needed inside resources can be reduced
- looping with for_each & iterator(optional) & content
- if iterator is not defined, then the default is working_block_name.value
- Create multiple nested blocks inside one resource. Eg : Many ingress/egress rules, IAM statements, etc.
- Refer - latest_provider_sg.tf

18. Tainting resources 
- terraform taint(older version of terraform) == terraform replace(latest version of terraform)
- manual changes + terraform done, but to replicate/record the env, terraform should have the aggregated code
-  "terraform apply -replace="resouce_name.local_name" 
    - if a ec2 instance application/ files were edited manually and u want it like original.
    - this cmd will destroy the old instance and create a new instance with same tf code configuration.

19. Splat Expression - gets list of attributes. Use "[*]". Refer - Output.tf

20. terraform graph - helps visualise the dependency. Send the output logs/DOT file to Graphviz online / offline by downloading dot.
Link - https://developer.hashicorp.com/terraform/cli/commands/graph 

21. Output the plan to file.

- terraform plan -out="any_name.plan" 
- this is a binary file containing plan output.
- read it with "terraform show any_name.plan" or in json format
- when is this useful???
    - u verify n store the prod plan, team modifies code for next release, 
    - then use - terraform apply "any_name.plan"
    - this makes sure verified/documented/desired outcome only goes to prod
    - Refer - infra.plan

22. terraform plan -target="resource_name.local_name"
- used to apply/plan on particular resource/instance
- dont use it normally
- use it only in case of troubleshotting errors.

23. API Throttling limit - 
- for large org/resource, doing api calls using plan/apply/refresh will cause issue/prod down
- how to avoid??
    - big proj into multiple folders
    - resource targeting if using one folder
    - terraform plan -refresh=false [Dont use, unless needed]

24. Meta-arguments -

Types::
- lifecycle block -
    - create_before_destroy - to avoid default behaviour of terrform( 1st destroy, then create new)
    - ignore_changes - to avoid default beviour of terraform (manual changes done on resource, will be reverted to original with apply cmd)
    - prevent_destroy - to avoid destroy of resource with terraform destroy
    - Refer iam_role.tf
- count - identical repeatative elements
- for_each 
    - repeatative + change in arguments for each iteration.
    - used to create multiple resources/modules, eg- users, instances
    - Refer - iam_user.tf
- depends_on -
    - explicitly defining dependency of resources are defined and creation/deletion(ulta) of resource happens accordingly.
    - if there is any attributes called internally, then there is no need to add depends_on, terraform will understand the order of creation of resources.
    - Refer - iam_user.tf

-  & many, Refer Link - https://developer.hashicorp.com/terraform/language/meta-arguments/depends_on