#terraform import nsxt_policy_tier0_gateway.tier0_gw ID

resource "nsxt_policy_tier0_gateway" "terraform-vrf" {
  description              = "Tier-0 VRF provisioned by Terraform"
  display_name             = "Tier0-vrf"
  failover_mode            = "PREEMPTIVE"
  default_rule_logging     = false
  enable_firewall          = true
  ha_mode                  = "ACTIVE_STANDBY"
  internal_transit_subnets = ["169.254.0.0/24"]
  transit_subnets          = ["101.64.0.0/16"]
  edge_cluster_path        = data.nsxt_policy_edge_cluster.p1w01ec03.path

  /*bgp_config {
    ecmp = true

    route_aggregation {
      prefix = "12.10.10.0/24"
    }
  }*/

  /*vrf_config {
    gateway_path        = data.nsxt_policy_tier0_gateway.terraform-vrf.path
    route_distinguisher = "62000:10"
    evpn_transit_vni    = 76001
    route_target {
      auto_mode      = false
      import_targets = ["62000:2"]
      export_targets = ["62000:3", "10.2.2.0:3"]
    }
  }*/
}

resource "nsxt_policy_tier0_gateway_interface" "terraform-interface-01" {
  display_name   = "terraform-interface-01"
  type           = "EXTERNAL"
  edge_node_path = data.nsxt_policy_edge_node.edge_node_1.path
  gateway_path   = nsxt_policy_tier0_gateway.p1w01ec01t0gw03.path
  segment_path   = nsxt_policy_vlan_segment.terraform-segment.path
  subnets        = ["172.23.50.2/24"]
  depends_on     = [nsxt_policy_tier0_gateway_interface.parent_uplink1]
}

resource "nsxt_policy_tier0_gateway_interface" "terraform-interface-02" {
  display_name   = "terraform-interface-02"
  type           = "EXTERNAL"
  edge_node_path = data.nsxt_policy_edge_node.edge_node_2.path
  gateway_path   = nsxt_policy_tier0_gateway.p1w01ec01t0gw03.path
  segment_path   = nsxt_policy_vlan_segment.terraform-segment.path
  subnets        = ["172.23.50.3/24"]
  depends_on     = [nsxt_policy_tier0_gateway_interface.parent_uplink1]
}

resource "nsxt_policy_static_route" "terraform-default-route" {
  display_name = "terraform-default-route"
  gateway_path = nsxt_policy_tier0_gateway.terraform-vrf.path
  network      = "0.0.0.0/0"

  next_hop {
    admin_distance = "1"
    ip_address     = "172.23.50.1"
  }
}