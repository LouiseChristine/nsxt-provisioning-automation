resource "vcd_org" "terraform-org" {
  name             = "terraform-org"
  full_name        = "terraform-org"
  description      = "terraform-org"
  is_enabled       = true
  delete_recursive = true
  delete_force     = true

  vapp_lease {
    maximum_runtime_lease_in_sec          = 3600 # 1 hour
    power_off_on_runtime_lease_expiration = true
    maximum_storage_lease_in_sec          = 0 # never expires
    delete_on_storage_lease_expiration    = false
  }
  vapp_template_lease {
    maximum_storage_lease_in_sec       = 604800 # 1 week
    delete_on_storage_lease_expiration = true
  }
}

resource "vcd_org_user" "terraform-org-admin" {
  org = "terraform-org"

  name        = "terraform-org-admin"
  description = "terraform org admin"
  role        = "Organization Administrator"
  password    = "Dialog@123"
}

resource "vcd_org_vdc" "terraform-vdc" {
  name = "terraform-vdc"
  org  = "terraform-org"

  allocation_model  = "AllocationPool"
  provider_vdc_name = "p1w01pvdc01"
  network_pool_name = "p1w01genevenp01"
  #edge_cluster_id   = data.vcd_nsxt_edge_cluster.ec.id

  compute_capacity {
    cpu {
      allocated = "100"
      limit     = "100"
    }

    memory {
      allocated = "1024"
      limit     = "1024"
    }
  }

  storage_profile {
    name    = "SSD Storage"
    enabled = true
    limit   = 1024
    default = true
  }

  network_quota            = "2"
  enabled                  = true
  enable_thin_provisioning = false
  enable_fast_provisioning = false
  delete_force             = false
  delete_recursive         = false
}