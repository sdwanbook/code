resource "sdwan_attach_feature_device_template" "DC1_Edge" {
  id = sdwan_feature_device_template.DC1_Edge.id
  version = sdwan_feature_device_template.DC1_Edge.version
  devices = [
    {
      id = "C8K-PAYG-c3e-081a-4f00-ad1e-8fabb0d11bc0"
      variables = {
        system_host_name = "DC1-Edge2"
        system_site_id = "10"
        system_system_IP = "10.0.10.2"
        vpn0_gig1_ipv4_address = "209.165.201.2/27"
        vpn0_gig2_ipv4_address = "192.168.20.2/24"
        bgp_neighbor_address = "172.16.10.6"
        bgp_neighbor_remote_as = "65010"
        bgp_router_id = "10.0.10.2"
        vpn10_gig3_ipv4_address = "172.16.10.5/30"
        vpn512_if_description = "Configured via API"
        vpn512_if_name = "GigabitEthernet4"
        vpn512_if_ipv4_address = "192.168.1.11/24"
      },
    },
    {
      id = "C8K-PAYG-928-798b-4276-a4b3-2a649a3d292f"
      variables = {
        system_host_name = "DC1-Edge1"
        system_site_id = "10"
        system_system_IP = "10.0.10.1"
        vpn0_gig1_ipv4_address = "209.165.201.1/27"
        vpn0_gig2_ipv4_address = "192.168.20.1/24"
        bgp_neighbor_address = "172.16.10.2"
        bgp_neighbor_remote_as = "65010"
        bgp_router_id = "10.0.10.1"
        vpn10_gig3_ipv4_address = "172.16.10.1/30"
        vpn512_if_description = "Configured via API"
        vpn512_if_name = "GigabitEthernet4"
        vpn512_if_ipv4_address = "192.168.1.10/24"
      },
    },
  ]
}
resource "sdwan_attach_feature_device_template" "DC2_Edge" {
  id = sdwan_feature_device_template.DC2_Edge.id
  version = sdwan_feature_device_template.DC2_Edge.version
  devices = [
    {
      id = "C8K-PAYG-d7f-d3a7-4fe4-9046-a70279232bca"
      variables = {
        system_host_name = "DC2-Edge1"
        system_site_id = "20"
        system_system_IP = "10.0.20.1"
        vpn0_gig1_ipv4_address = "209.165.201.3/27"
        vpn0_gig2_ipv4_address = "192.168.20.3/24"
        bgp_neighbor_address = "172.16.20.2"
        bgp_neighbor_remote_as = "65020"
        bgp_router_id = "10.0.20.1"
        vpn10_gig3_ipv4_address = "172.16.20.1/30"
        vpn512_if_description = "Management"
        vpn512_if_name = "GigabitEthernet4"
        vpn512_if_ipv4_address = "192.168.1.12/24"
      },
    },
    {
      id = "C8K-PAYG-e8f-9886-4f7d-af54-36c81d17093c"
      variables = {
        system_host_name = "DC2-Edge2"
        system_site_id = "20"
        system_system_IP = "10.0.20.2"
        vpn0_gig1_ipv4_address = "209.165.201.4/27"
        vpn0_gig2_ipv4_address = "192.168.20.4/24"
        bgp_neighbor_address = "172.16.20.6"
        bgp_neighbor_remote_as = "65020"
        bgp_router_id = "10.0.20.2"
        vpn10_gig3_ipv4_address = "172.16.20.5/30"
        vpn512_if_description = "Management"
        vpn512_if_name = "GigabitEthernet4"
        vpn512_if_ipv4_address = "192.168.1.13/24"
      },
    },
  ]
}
resource "sdwan_attach_feature_device_template" "Branch1_Edge1" {
  id = sdwan_feature_device_template.Branch1_Edge1.id
  version = sdwan_feature_device_template.Branch1_Edge1.version
  devices = [
    {
      id = "C8K-PAYG-508-1091-4606-8070-c2a3bc4145a6"
      variables = {
        system_host_name = "BR1-Edge1"
        system_site_id = "101"
        system_system_IP = "10.0.101.1"
        vpn0_mpls_if_name = "GigabitEthernet1"
        vpn0_mpls_ipv4_address = "192.168.20.5/24"
        vpn10_ospf_if_name = "GigabitEthernet3"
        ospf_router_id = "10.0.101.1"
        vpn10_if_name = "GigabitEthernet3"
        vpn10_if_ipv4_address = "172.16.101.1/30"
        vpn512_if_description = "Management"
        vpn512_if_name = "GigabitEthernet4"
        vpn512_if_ipv4_address = "192.168.1.14/24"
      },
    },
  ]
}
resource "sdwan_attach_feature_device_template" "Branch1_Edge2" {
  id = sdwan_feature_device_template.Branch1_Edge2.id
  version = sdwan_feature_device_template.Branch1_Edge2.version
  devices = [
    {
      id = "C8K-PAYG-b81-2145-4958-b9a6-e534ac272276"
      variables = {
        system_host_name = "BR1-Edge2"
        system_site_id = "101"
        system_system_IP = "10.0.101.2"
        vpn0_biz-inet_name = "GigabitEthernet1"
        vpn0_biz-inet_ipv4_address = "209.165.201.5/27"
        vpn0_lte_if_name = "GigabitEthernet2"
        vpn0_lte_ipv4_address = "209.165.202.129/27"
        vpn10_ospf_if_name = "GigabitEthernet4"
        ospf_router_id = "10.0.101.2"
        vpn10_if_name = "GigabitEthernet4"
        vpn10_if_ipv4_address = "172.16.101.5/30"
        vpn512_if_description = "Management"
        vpn512_if_name = "GigabitEthernet5"
        vpn512_if_ipv4_address = "192.168.1.15/24"
      },
    },
  ]
}
resource "sdwan_attach_feature_device_template" "Branch2_Edge" {
  id = sdwan_feature_device_template.Branch2_Edge.id
  version = sdwan_feature_device_template.Branch2_Edge.version
  devices = [
    {
      id = "C8K-PAYG-878-30c7-4b01-9290-a8f5df73811d"
      variables = {
        system_host_name = "BR2-Edge1"
        system_site_id = "102"
        system_system_IP = "10.0.102.1"
        vpn0_mpls_ipv4_address = "192.168.20.6/24"
        vpn0_inet_ipv4_address = "209.165.201.6/27"
        vpn0_lte_ipv4_address = "209.165.202.130/27"
        vpn10_if_ipv4_address = "10.10.102.1/24"
        vpn10_gig4_shutdown = "false"
        vpn512_if_description = "Management"
        vpn512_if_name = "GigabitEthernet5"
        vpn512_if_ipv4_address = "192.168.1.16/24"
      },
    },
    {
      id = "C8K-PAYG-1a9-657d-4470-9cf9-f3b1a715e4e6"
      variables = {
        system_host_name = "BR2-Edge2"
        system_site_id = "102"
        system_system_IP = "10.0.102.2"
        vpn0_mpls_ipv4_address = "192.168.20.7/24"
        vpn0_inet_ipv4_address = "209.165.201.7/27"
        vpn0_lte_ipv4_address = "209.165.202.131/27"
        vpn10_if_ipv4_address = "10.10.102.2/24"
        vpn10_gig4_shutdown = "false"
        vpn512_if_description = "Management"
        vpn512_if_name = "GigabitEthernet5"
        vpn512_if_ipv4_address = "192.168.1.17/24"
      },
    },
  ]
}
resource "sdwan_attach_feature_device_template" "Branch3_Edge" {
  id = sdwan_feature_device_template.Branch3_Edge.id
  version = sdwan_feature_device_template.Branch3_Edge.version
  devices = [
    {
      id = "C8K-PAYG-d35-0d9c-43c1-bf38-5d4bf10156d4"
      variables = {
        system_host_name = "BR3-Edge1"
        system_site_id = "103"
        system_system_IP = "10.0.103.1"
        vpn0_mpls_ipv4_address = "192.168.20.8/24"
        vpn0_inet_ipv4_address = "209.165.201.8/27"
        vpn0_lte_ipv4_address = "209.165.202.132/27"
        vpn10_if_ipv4_address = "172.16.103.1/30"
        vpn10_fw_if_ipv4_address = "10.50.50.1/24"
        vpn512_if_description = "Management"
        vpn512_if_name = "GigabitEthernet6"
        vpn512_if_ipv4_address = "192.168.1.18/24"
      },
    },
  ]
}
