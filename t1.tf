resource "vcd_edgegateway" "egw" {
  org = "terraform-org"
  vdc = "terraforn-vdc"

  name          = "terraform-egw"
  description   = "terraform new edge gateway"
  configuration = "compact"

  external_network {
    name = "my-ext-net1"

    subnet {
      ip_address            = "192.168.30.51"
      gateway               = "192.168.30.49"
      netmask               = "255.255.255.240"
      use_for_default_route = true
    }
  }
}

resource "vcd_network_routed" "rnet1" {
  name         = "rnet1"
  org          = "my-org"
  vdc          = "my-vdc"
  edge_gateway = vcd_edgegateway.egw.name
  gateway      = "192.168.2.1"

  static_ip_pool {
    start_address = "192.168.2.2"
    end_address   = "192.168.2.100"
  }
}