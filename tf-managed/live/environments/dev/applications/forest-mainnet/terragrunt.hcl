# Automatically find the root terragrunt.hcl and inherit its
# configuration
include "root" {
  path = find_in_parent_folders("root.hcl")
}

# Load the actual Terraform module
terraform {
  source = format("%s/../modules/forest-droplet", get_parent_terragrunt_dir())
}

inputs = {
  chain        = "mainnet"
  droplet_size = "s-4vcpu-16gb-amd"
  service_name = "forest-mainnet"
}
