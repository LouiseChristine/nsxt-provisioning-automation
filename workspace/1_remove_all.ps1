
terraform state rm data.nsxt_policy_edge_cluster.p1w01ec03
Start-Sleep -Milliseconds 100;
terraform state rm data.nsxt_policy_edge_node.p1w01en05
Start-Sleep -Milliseconds 100;
terraform state rm data.nsxt_policy_edge_node.p1w01en06
Start-Sleep -Milliseconds 100;
terraform state rm data.nsxt_policy_tier0_gateway.p1w01ec01t0gw03
Start-Sleep -Milliseconds 100;
terraform state rm data.nsxt_policy_transport_zone.VCF-edge_p1w01ec03_uplink-tz
Start-Sleep -Milliseconds 100;
terraform state rm data.vcd_nsxt_manager.p1w01nsx01
Start-Sleep -Milliseconds 100;
terraform state rm data.vcd_nsxt_tier0_router.router 
Start-Sleep -Milliseconds 100;
terraform state rm nsxt_policy_static_route.terraform-default-route
Start-Sleep -Milliseconds 100;
terraform state rm nsxt_policy_tier0_gateway.terraform-vrf
Start-Sleep -Milliseconds 100;
terraform state rm nsxt_policy_tier0_gateway_interface.terraform-interface-01
Start-Sleep -Milliseconds 100;
terraform state rm nsxt_policy_tier0_gateway_interface.terraform-interface-02
Start-Sleep -Milliseconds 100;
terraform state rm nsxt_policy_vlan_segment.terraform-segment
Start-Sleep -Milliseconds 100;
terraform state rm vcd_external_network_v2.terraform-vrf
Start-Sleep -Milliseconds 100;
terraform state rm vcd_nsxt_edgegateway.terraform-edge
Start-Sleep -Milliseconds 100;
terraform state rm vcd_org.terraform-org
Start-Sleep -Milliseconds 100;
terraform state rm vcd_org_user.terraform-org-admin
Start-Sleep -Milliseconds 100;
terraform state rm vcd_org_vdc.terraform-vdc
Start-Sleep -Milliseconds 100;