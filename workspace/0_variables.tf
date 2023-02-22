# Username & Password for NSX-T Manager
  variable "nsxt_username" {
  default = "louise_09496@dialogcloud.local"
}

# Username & Password for NSX-T Manager
  variable "vcd_username" {
  default = "louise_09496"
}

variable "password" {
    default = "JakeSully@09"
}

## NSX-T Provisioning: Segment, T0-VRF
variable "vlan" {
  default = "449"
}

variable "interface_01_subnets" {
  default = "172.23.50.2/24"
}

variable "interface_02_subnets" {
  default = "172.23.50.3/24"
}

variable "gateway"{
  default = "172.23.50.1"
}

## VCD Provisioning: VDC Spec
variable "cpu_allocated" {
  default = "10"            # in MHz
}

variable "cpu_limit" {
  default = "10"            # in MHz
}

variable "memory_allocated" {
  default = "1024"          # in MB
}

variable "memory_limit" {
  default = "1024"          # in MB
}

variable "storage_limit" {
  default = "1024"          # in MB
}

variable "network_quota" {
  default = "2"
}

/*#####################################################################
replace all "terraform" with "subnumber-cx_name"
replace "terraform-org" with "org_id-cx_name"
#####################################################################*/


## Variables ## NSX Manager ##
variable "nsx_manager" {
    default = "10.246.2.75"
}

variable "segment_name" {
  default = "terraform-segment"  
}

variable "nsxt_vrf_name" {
  default = "terraform-vrf"
}

variable "interface_01" {
  default = "terraform-interface-01"
}

variable "interface_02" {
  default = "terraform-interface-02"
}

variable "default_route" {
  default = "terraform-default-route"
}

## Variables ## VCD ##
variable "org_name" {
  default = "terraform-org"
}

variable "vdc_name" {
  default = "terraform-vdc"
}

variable "org_admin_name"{
  default = "terraform-org-admin"
}

# Importing NSX-T VRF to VCD
variable "vcd_vrf_name" {
  default = "terraform-vrf"
}

# Create T1 in VCD
variable "vcd_edgegateway" {
  default = "terraform-edge"
}