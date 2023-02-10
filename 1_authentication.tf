terraform {
  required_providers {
    nsxt = {
      source  = "vmware/nsxt"
      version = "3.3.0"
    }
    vcd = {
      source  = "vmware/vcd"
      version = "3.8.2"
    }
  }
}

provider "nsxt" {
  host                  = var.nsx_manager
  username              = var.nsxt_username
  password              = var.password
  allow_unverified_ssl  = true
  max_retries           = 10
  retry_min_delay       = 500
  retry_max_delay       = 5000
  retry_on_status_codes = [429]
}


provider "vcd" {
  user              = var.vcd_username
  password          = var.password
  auth_type         = "integrated"
  org               = "System"
  url               = "https://vcloud.dialogcloud.lk/api"
  max_retry_timeout = 500
  #allow_unverified_ssl = var.vcd_allow_unverified_ssl
}