# Project: Provision Resource Group & Storage Account

**Requirement**: Set up Resource Group + Storage Account as a remote state backend.

**Azure Resources**: Resource Groups, Storage Accounts, Access Keys

**CI/CD**: Basic GitHub Actions pipeline: terraform fmt, validate, init, plan.

**Best Practices**: Remote state storage, tagging conventions, secure backend secrets in Key Vault.

## Resources
- [Microsoft Azure Stroage Account](https://learn.microsoft.com/en-us/azure/storage/common/storage-account-overview)

## Required Variables
**[Authenticate](https://learn.microsoft.com/en-us/azure/developer/terraform/authenticate-to-azure-with-service-principle?tabs=bash)**
export ARM_CLIENT_ID=<Azure Application Client ID>
export ARM_TENANT_ID=<Azure Tenant ID>
export ARM_CLIENT_SECRET=<Azure Application Secret value>
export ARM_SUBSCRIPTION_ID=<Azure Subscription ID>
