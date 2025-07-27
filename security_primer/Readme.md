Folder related learning::

1. multiple providers configuration - use "alias" under providers and "provider" argument in the particular resource

2. Sensitive parameter - 
- for security, make sure sensitive data is not in output CLI/ logs
- use "sensitive = true" or use resource type with sensitivity(not available in every thing)
- you cannot output the value when you have sensitivity is set
- some of the aws resources like db have default sensitivity, so without adding the argument, the ouput logs will not print password.
- BUT, state files still contains the password in raw format.
- Refer - sensitive.tf

3. Vault - 
- for dev  purpose, install and use it in local. Link - https://developer.hashicorp.com/terraform/tutorials/secrets/secrets-vault 
- create and key & password and run it in local. Refer - vault.tf
- you can use vault to fetch aws provider keys also
- BUT, state files still contains password in raw format.

4. .lock.hcl - 
- stores the required_provider configuration version.
- if any updation is done to the provider.tf, and is contradictory to lock.hcl file, then error is thrown
- use terraform init -upgrade
- hash values found in .lock.hcl file - makes sure exact version is only downloaded
- it only remembers the provider version and not remote module's version( latest is pulled always ).

Always store state file safely in remote !!!