resource "vcd_external_network_v2" "terraform-vrf" {
  name        = var.vcd_vrf_name
  description = var.vcd_vrf_name

  nsxt_network {
    nsxt_manager_id      = data.vcd_nsxt_manager.p1w01nsx01.id
    nsxt_tier0_router_id = data.vcd_nsxt_tier0_router.router.id
  }

  ip_scope {
    enabled       = true
    gateway       = "192.168.1.1"
    prefix_length = "24"

    static_ip_pool {
      start_address = "192.168.1.2"
      end_address   = "192.168.1.20"
    }
  }
}