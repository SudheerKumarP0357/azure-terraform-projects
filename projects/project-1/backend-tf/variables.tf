variable "resource_group_name" {
  description = "Azure Resource Group Name"
  type        = string
  default = "backend"
}

variable "location" {
  description = "Azure Location for Resources[Regions]"
  type        = string
}

variable "suffix" {
  default     = "-rg"
  type        = string
  description = "suffix, appended to resource group name"

}
variable "resource_group_tags" {
  type = object({
    Owner       = string
    CreatedWith = string
    ManagedBy   = string
  })
}

variable "storage_account_name" {
  type = string
  description = "An unique storage account name across azure cloud"
}