# Example Terraform deployment with separate Plan and Apply jobs

- Uses separate stages for Terraform 'plan' and 'apply'
- Plan output is captured and passed to apply
  - Recommended approach is using pipeline artifacts to store the plan file (and the Terraform .tf files)
  - Alternate approach makes use of the Cache task. While this does appear to work, it is not recommended, as unless you're really careful you run the risk of the cache picking the wrong files to restore.
- Uses the [Microsoft DevLabs Terraform extension](https://marketplace.visualstudio.com/items?itemName=ms-devlabs.custom-terraform-tasks) tasks. See <https://github.com/microsoft/azure-pipelines-terraform/tree/main> for more info on using the tasks.

## Configuration

az group create --resource-group rg-tf-plan-apply-australiaeast --location australiaeast

Create service connection in Azure Pipelines for this resource group

Locate the service principal created, and add a role assignment for that to allow it to access a container for Terraform state storage.

terraform init -backend-config=storage_account_name=sttfdemostateausteast -backend-config=container_name=plan-apply-tfstate -backend-config="key=terraform.tfstate" -backend-config=resource_group_name=rg-tfdemo-state-australiaeast
