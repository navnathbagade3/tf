module "resource_group" {
  source = "api.env0.com/39137cc6-6aa7-48c6-b52d-f7a5e7748e87/mgm-af-azure-resource-group/azurerm"
  #source = "git@github.com:MGMResorts/mgm-af-azure-resource-group.git?ref=v1" # Use if not env0, requires github access.
  version  = "~> 1.0" # Comment out if using github source, pin to snapshot tag if tagged from develop
  name     = join("-", [var.subject_name, module.globals.short_location, "rg", module.globals.short_environment])
  location = "west us"
}
