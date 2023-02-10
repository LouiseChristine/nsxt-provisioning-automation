resource "vcd_nsxt_edgegateway" "terraform-edge" {
  org         = var.org_name
  owner_id    = vcd_org_vdc.terraform-vdc.id
  name        = var.vcd_edgegateway
  description = var.vcd_edgegateway

  external_network_id = vcd_external_network_v2.terraform-vrf.id
  # dedicate_external_network = true
  # route_advertisement_types = ["TIER1_CONNECTED"]

  subnet {
    gateway       = "192.168.1.1"
    prefix_length = "24"
    
    primary_ip = "192.168.1.2"
    allocated_ips {
      start_address = "192.168.1.3"
      end_address   = "192.168.1.20"
    }
  }
}

/*resource "nsxt_policy_tier1_gateway" "tier1_gw" {
  display_name              = var.vcd_edgegateway
  route_advertisement_types = ["TIER1_CONNECTED"]
}*/