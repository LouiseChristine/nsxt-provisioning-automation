resource "vcd_nsxt_edgegateway" "terraform-edge" {
  org         = "terraform-org"
  owner_id    = vcd_org_vdc.terraform-vdc.id
  name        = "terraform-edge"
  description = "terraform-edge"

  external_network_id = vcd_external_network_v2.terraform-vrf.id

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