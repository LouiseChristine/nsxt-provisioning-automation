resource "nsxt_policy_tier0_gateway" "terraform-vrf" {
  depends_on   = [data.nsxt_policy_tier0_gateway.p1w01ec01t0gw03]
  #description  = "Tier-0 VRF provisioned by Terraform"
  display_name = var.nsxt_vrf_name
  #failover_mode            = "PREEMPTIVE"
  default_rule_logging     = false
  enable_firewall          = false
  ha_mode                  = "ACTIVE_ACTIVE"
  internal_transit_subnets = ["169.254.0.0/24"]
  transit_subnets          = ["101.64.0.0/16"]
  edge_cluster_path        = data.nsxt_policy_edge_cluster.p1w01ec03.path

  /*bgp_config {
    ecmp = true

    route_aggregation {
      prefix = "12.10.10.0/24"
    }
  }*/

  vrf_config {
    gateway_path = data.nsxt_policy_tier0_gateway.p1w01ec01t0gw03.path
    /*route_distinguisher = "62000:10"
    evpn_transit_vni    = 76001
    route_target {
      auto_mode      = false
      import_targets = ["62000:2"]
      export_targets = ["62000:3", "10.2.2.0:3"]
    }*/
  }
}

resource "nsxt_policy_tier0_gateway_interface" "terraform-interface-01" {
  #depends_on     = [data.nsxt_policy_tier0_gateway_interface.parent_uplink1]
  display_name   = var.interface_01
  type           = "EXTERNAL"
  edge_node_path = data.nsxt_policy_edge_node.p1w01en05.path
  gateway_path   = nsxt_policy_tier0_gateway.terraform-vrf.path
  segment_path   = nsxt_policy_vlan_segment.terraform-segment.path
  subnets        = [var.interface_01_subnets]
}

resource "nsxt_policy_tier0_gateway_interface" "terraform-interface-02" {
  #depends_on     = [nsxt_policy_tier0_gateway_interface.parent_uplink1]
  display_name   = var.interface_02
  type           = "EXTERNAL"
  edge_node_path = data.nsxt_policy_edge_node.p1w01en06.path
  gateway_path   = nsxt_policy_tier0_gateway.terraform-vrf.path
  segment_path   = nsxt_policy_vlan_segment.terraform-segment.path
  subnets        = [var.interface_02_subnets]
}

resource "nsxt_policy_static_route" "terraform-default-route" {
  display_name = var.default_route
  gateway_path = nsxt_policy_tier0_gateway.terraform-vrf.path
  network      = "0.0.0.0/0"

  next_hop {
    admin_distance = "1"
    ip_address     = var.gateway
  }
}