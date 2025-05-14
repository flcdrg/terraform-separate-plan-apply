# Example Terraform deployment with separate Plan and Apply jobs

## Configuration

az group create --resource-group rg-tf-plan-apply-australiaeast --location australiaeast

Create service connection in Azure Pipelines for this resource group

Locate the service principal created, and add a role assignment for that to allow it to access a container for Terraform state storage.

terraform init -backend-config=storage_account_name=sttfdemostateausteast -backend-config=container_name=plan-apply-tfstate -backend-config="key=tfstate" -backend-config=resource_group_name=rg-tfdemo-state-australiaeast