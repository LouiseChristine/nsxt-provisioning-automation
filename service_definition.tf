data "nsxt_policy_transport_zone" "VCF-edge_p1w01ec03_uplink-tz" {
    display_name = "VCF-edge_p1w01ec03_uplink-tz"
}

# the NSX-T Edge Cluster
data "nsxt_policy_edge_cluster" "p1w01ec03" {
    display_name = "p1w01ec03"
}

data  "nsxt_policy_edge_node" "edge_node_1" {
    display_name = "p1w01en05"
}

data  "nsxt_policy_edge_node" "edge_node_2" {
    display_name = "p1w01en06"
}

data "nsxt_policy_tier0_gateway" "p1w01ec01t0gw03" {
  display_name = "p1w01ec01t0gw03"
}