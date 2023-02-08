resource "vcd_org" "terraform-org" {
  name             = "terraform-org"
  full_name        = "My terraform organization"
  description      = "The pride of my work"
  is_enabled       = true
  delete_recursive = false
  delete_force     = false

  vapp_lease {
    maximum_runtime_lease_in_sec          = 3600 # 1 hour
    power_off_on_runtime_lease_expiration = true
    maximum_storage_lease_in_sec          = 0 # never expires
    delete_on_storage_lease_expiration    = false
  }
  vapp_template_lease {
    maximum_storage_lease_in_sec       = 604800 # 1 week
    delete_on_storage_lease_expiration = false
  }
}

resource "vcd_org_user" "terraform-user" {
  org = "datacloud"

  name            = "terraform-user"
  password        = "Dialog@123"
  full_name       = "terrafomr-user"
  description     = "Org user terraform-user"
  role            = "Organization Administrator"
  enabled         = true
  take_ownership  = true
  provider_type   = "INTEGRATED"
  stored_vm_quota = 20
  #deployed_vm_quota = 20
  #instant_messaging = "@test_user_vapp_author"
  email_address = "terraform-user@test.company.org"
}

resource "vcd_org_vdc" "terraform-vdc" {
  name        = "terraform-vdc"
  description = "The pride of my work"
  org         = "terraform-org"

  allocation_model  = "AllocationPool"
  network_pool_name = "p1w01genevenp01"
  provider_vdc_name = "p1w01pvdc01"

  compute_capacity {
    cpu {
      allocated = 22
    }

    memory {
      allocated = 2048
    }
  }

  storage_profile {
    name    = "SSD Storage"
    limit   = 40
    default = true
  }

  /*  enabled                  = true
  enable_thin_provisioning = true
  enable_fast_provisioning = true
  delete_force             = true
  delete_recursive         = true */
}