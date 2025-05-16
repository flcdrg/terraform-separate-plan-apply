terraform {
  backend "azurerm" {
    # use_azuread_auth = true # Whether Azure Active Directory Authentication for storage account data plane authentication. This can also be sourced from the ARM_USE_AZUREAD environment variable.
    # use_oidc         = true # Set to true to use OpenID Connect / Workload identity federation to authenticate to the storage account data plane. This can also be set via the ARM_USE_OIDC environment variable.
  }
}
