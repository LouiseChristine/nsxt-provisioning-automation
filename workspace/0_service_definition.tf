locals {
  org_id = "IDC00xx"
  vcd_subnumber = "099xx"
  cx_name = "terraform"
}

# the NSX-T Transport Zone Uplink
data "nsxt_policy_transport_zone" "VCF-edge_p1w01ec03_uplink-tz" {
  display_name = "VCF-edge_p1w01ec03_uplink-tz"
}

# the NSX-T Edge Cluster
data "nsxt_policy_edge_cluster" "p1w01ec03" {
  display_name = "p1w01ec03"
}

data "nsxt_policy_tier0_gateway" "p1w01ec01t0gw03" {
  display_name = "p1w01ec01t0gw03"
}

data "nsxt_policy_edge_node" "p1w01en05" {
  display_name      = "p1w01en05"
  edge_cluster_path = data.nsxt_policy_edge_cluster.p1w01ec03.path
}

data "nsxt_policy_edge_node" "p1w01en06" {
  display_name      = "p1w01en06"
  edge_cluster_path = data.nsxt_policy_edge_cluster.p1w01ec03.path
}

data "vcd_nsxt_manager" "p1w01nsx01" {
  name = "p1w01nsx01"
}

/*data "vcd_nsxt_tier0_router" "router" {
  name            = "terraform-vrf"
  nsxt_manager_id = data.vcd_nsxt_manager.p1w01nsx01.id
}*/

