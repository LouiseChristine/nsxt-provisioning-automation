# create segment 
resource "nsxt_policy_vlan_segment" "terraform-segment" {
  description         = "Terraform provisioned VLAN Segment"
  display_name        = "terraform-segment"
  transport_zone_path = data.nsxt_policy_transport_zone.VCF-edge_p1w01ec03_uplink-tz.path
  vlan_ids            = ["449"]

  advanced_config {
    connectivity = "ON"
  }

}