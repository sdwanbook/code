resource "sdwan_cedge_aaa_feature_template" "Global_AAA" {
  # id = "aa0fa123-394f-4660-8c9a-b6e6d7c81788"
  name = "Global_AAA"
  description = "Global_AAA"
  device_types = ["vedge-C8000V"]
  server_groups_priority_order = "local"
  users =   [
    {
      name = "admin",
      optional = false,
      password = "$6$ae90e6012e7f0de0$uPf0DHAJi3h2W08AZwx0vFuBwqGtMMi2dupYHLenhebcNUYZY/is0uuTmrxtLExIyIZ10E8AClOThTz2jmFyv0",
      privilege_level = "15",
      secret = "$9$2/ME2/QH2/QJ2U$r.sdEFwawQDR..1wfzgs1RO8gl7xnH0BpgqINXO2ENE",
    }
  ]
}

resource "sdwan_cedge_global_feature_template" "Default_EQUINIX_C8000V_GLOBAL_CISCO_V01" {
  # id = "962813a4-fa7d-4a1b-87a0-f31d1e396c22"
  name = "Default_EQUINIX_C8000V_GLOBAL_CISCO_V01"
  description = "Default Equinix ICGW C8000V Global CISCO TEMPLATE"
  device_types = ["vedge-C8000V"]
  source_interface = "GigabitEthernet2"
}

resource "sdwan_cisco_banner_feature_template" "Factory_Default_Retail_Banner" {
  # id = "f9cfb80f-a95d-4471-af58-6bca31a13c44"
  name = "Factory_Default_Retail_Banner"
  description = "Factory Default Retail Banner"
  device_types = ["vedge-C8000V"]
  login = "Un authorised Logins tracked"
  motd = "Restricted Use"
}

resource "sdwan_cisco_bfd_feature_template" "Default_BFD_Cisco_V01" {
  # id = "7a368a9c-e29c-4156-96e3-ed8cae8e0ad6"
  name = "Default_BFD_Cisco_V01"
  description = "Factory Default template for BFD Cisco"
  device_types = ["vedge-C1111-8PLTELA", "vedge-C8000V", "vedge-CSR-1000v", "vedge-ISR-4331"]
  colors =   [
    {
      color = "lte",
      hello_interval = 1000,
      multiplier = 1,
      pmtu_discovery = false,
    }
  ]
  multiplier = 2
  poll_interval = 123400
}

resource "sdwan_cisco_bgp_feature_template" "DC1_BGP" {
  # id = "26e7772b-232c-474e-9e1b-1bc9597bad9f"
  name = "DC1_BGP"
  description = "DC1_BGP"
  device_types = ["vedge-C8000V"]
  address_families =   [
    {
      family_type = "ipv4-unicast",
      redistribute_routes = [
        {
          protocol = "omp",
        }
      ],
    }
  ]
  as_number = "65001"
  ipv4_neighbors =   [
    {
      address_variable = "bgp_neighbor_address",
      remote_as_variable = "bgp_neighbor_remote_as",
    }
  ]
  router_id_variable = "bgp_router_id"
  shutdown = "true"
}

resource "sdwan_cisco_bgp_feature_template" "DC2_BGP" {
  # id = "72e98801-7944-48b5-81ab-e699e1d9a7d9"
  name = "DC2_BGP"
  description = "DC2_BGP"
  device_types = ["vedge-C8000V"]
  address_families =   [
    {
      family_type = "ipv4-unicast",
      redistribute_routes = [
        {
          protocol = "omp",
        }
      ],
    }
  ]
  as_number = "65002"
  ipv4_neighbors =   [
    {
      address_variable = "bgp_neighbor_address",
      remote_as_variable = "bgp_neighbor_remote_as",
    }
  ]
  router_id_variable = "bgp_router_id"
  shutdown = "true"
}

resource "sdwan_cisco_logging_feature_template" "Default_Logging_Cisco_V01" {
  # id = "0c4cfc2b-d458-4c3f-840d-e0b98ac0ee26"
  name = "Default_Logging_Cisco_V01"
  description = "Factory Default template for Logging Cisco"
  device_types = ["vedge-C1111-8PLTELA", "vedge-C8000V", "vedge-CSR-1000v", "vedge-ISR-4331"]
}

resource "sdwan_cisco_omp_feature_template" "Global_OMP" {
  # id = "36ead827-471f-46e7-98a1-7feeb014e721"
  name = "Global_OMP"
  description = "Global_OMP"
  device_types = ["vedge-C8000V"]
  advertise_ipv4_routes =   [
    {
      protocol = "connected"
    },
    {
      protocol = "static"
    }
  ]
  advertise_ipv6_routes =   [
    {
      protocol = "connected"
    },
    {
      protocol = "static"
    }
  ]
}

resource "sdwan_cisco_ospf_feature_template" "Branch1_VPN0_OSPF" {
  # id = "1da6e827-4665-4f85-a882-2d42fe0bb361"
  name = "Branch1_VPN0_OSPF"
  description = "Branch1_VPN0_OSPF"
  device_types = ["vedge-C8000V"]
  areas =   [
    {
      area_number = 0,
      interfaces = [
        {
          name = "GigabitEthernet1",
        },
        {
          name = "GigabitEthernet3",
          passive_interface = true,
        }
      ],
      nssa = true,
      stub = true,
    }
  ]
  router_id = "10.0.102.2"
}

resource "sdwan_cisco_ospf_feature_template" "Branch1_VPN10_OSPF" {
  # id = "f8ce8056-aefd-418c-939e-3f94714ad6d2"
  name = "Branch1_VPN10_OSPF"
  description = "Branch1_VPN10_OSPF"
  device_types = ["vedge-C8000V"]
  areas =   [
    {
      area_number = 0,
      interfaces = [
        {
          name_variable = "vpn10_ospf_if_name",
        }
      ],
      nssa = true,
      stub = true,
    }
  ]
  redistribute =   [
    {
      protocol = "omp",
    }
  ]
  router_id_variable = "ospf_router_id"
}

resource "sdwan_cisco_security_feature_template" "Default_Security_Cisco_V01" {
  # id = "4dbebe04-0ebe-4249-a014-2ced7f8afc40"
  name = "Default_Security_Cisco_V01"
  description = "Factory Default template for Security Cisco"
  device_types = ["vedge-C1111-8PLTELA", "vedge-C8000V", "vedge-CSR-1000v", "vedge-ISR-4331"]
  authentication_type = ["ah-sha1-hmac", "sha1-hmac"]
  integrity_type = ["esp", "ip-udp-esp"]
}

resource "sdwan_cisco_system_feature_template" "Global_System" {
  # id = "7aa41647-87d5-44ca-ab66-a2117f0ce5c5"
  name = "Global_System"
  description = "Global_System"
  device_types = ["vedge-C8000V"]
  console_baud_rate = "9600"
  hostname_variable = "system_host_name"
  site_id_variable = "system_site_id"
  system_ip_variable = "system_system_IP"
}

resource "sdwan_cisco_vpn_feature_template" "Branch1_VPN0_Edge1" {
  # id = "7173bacb-040f-434a-9817-4832cab61549"
  name = "Branch1_VPN0_Edge1"
  description = "Branch1_VPN0_Edge1"
  device_types = ["vedge-C8000V"]
  vpn_id = 0
  dns_ipv4_servers =   [
    {
      address = "198.18.133.1",
      role = "primary",
    }
  ]
  ipv4_static_routes =   [
    {
      next_hops = [
        {
          address = "192.168.100.2",
        },
        {
          address = "192.168.20.254",
        }
      ],
      prefix = "0.0.0.0/0",
    }
  ]
}

resource "sdwan_cisco_vpn_feature_template" "Branch1_VPN0_Edge2" {
  # id = "5ec3b496-01c2-4bc8-9458-be71aed5a55f"
  name = "Branch1_VPN0_Edge2"
  description = "Branch1_VPN0_Edge2"
  device_types = ["vedge-C8000V"]
  vpn_id = 0
  dns_ipv4_servers =   [
    {
      address = "198.18.133.1",
      role = "primary",
    }
  ]
  ipv4_static_routes =   [
    {
      next_hops = [
        {
          address = "209.165.201.30",
        },
        {
          address = "209.165.202.158",
        }
      ],
      prefix = "0.0.0.0/0",
    }
  ]
}

resource "sdwan_cisco_vpn_feature_template" "Branch1_VPN10" {
  # id = "638b16a9-6e46-46e1-ba66-9a7e200a6826"
  name = "Branch1_VPN10"
  description = "Branch1_VPN10"
  device_types = ["vedge-C8000V"]
  vpn_id = 10
  omp_advertise_ipv4_routes =   [
    {
      protocol = "ospf",
      protocol_sub_type = [
        "external"
      ],
    }
  ]
}

resource "sdwan_cisco_vpn_feature_template" "Branch2_VPN0" {
  # id = "a051b5c9-2eaa-405f-af17-bb4abb3aea86"
  name = "Branch2_VPN0"
  description = "Branch2_VPN0"
  device_types = ["vedge-C8000V"]
  vpn_id = 0
  dns_ipv4_servers =   [
    {
      address = "198.18.133.1",
      role = "primary",
    }
  ]
  ipv4_static_routes =   [
    {
      next_hops = [
        {
          address = "209.165.201.30",
        },
        {
          address = "209.165.202.158",
        },
        {
          address = "192.168.20.254",
        }
      ],
      prefix = "0.0.0.0/0",
    }
  ]
}

resource "sdwan_cisco_vpn_feature_template" "Branch2_VPN10" {
  # id = "b0f487c7-e091-49c5-9630-9ecdd621515c"
  name = "Branch2_VPN10"
  description = "Branch2_VPN10"
  device_types = ["vedge-C8000V"]
  vpn_id = 10
  omp_advertise_ipv4_routes =   [
    {
      protocol = "connected",
    }
  ]
}

resource "sdwan_cisco_vpn_feature_template" "Branch3_VPN0" {
  # id = "c1b7f58a-503c-4b44-98e8-cfb63b397d8a"
  name = "Branch3_VPN0"
  description = "Branch3_VPN0"
  device_types = ["vedge-C8000V"]
  vpn_id = 0
  dns_ipv4_servers =   [
    {
      address = "198.18.133.1",
      role = "primary",
    }
  ]
  ipv4_static_routes =   [
    {
      next_hops = [
        {
          address = "209.165.201.30",
        },
        {
          address = "209.165.202.158",
        },
        {
          address = "192.168.20.254",
        }
      ],
      prefix = "0.0.0.0/0",
    }
  ]
}

resource "sdwan_cisco_vpn_feature_template" "Branch3_VPN10" {
  # id = "0a84449a-5980-47ca-9282-81abb98a3efa"
  name = "Branch3_VPN10"
  description = "Branch3_VPN10"
  device_types = ["vedge-C8000V"]
  vpn_id = 10
  omp_advertise_ipv4_routes =   [
    {
      protocol = "eigrp",
    }
  ]
  services =   [
    {
      address = [
        "10.50.50.10"
      ],
      service_types = "FW",
    }
  ]
}

resource "sdwan_cisco_vpn_feature_template" "DC1_VPN0" {
  # id = "c0efebcb-55e3-42cd-a4e3-9102c2a0715f"
  name = "DC1_VPN0"
  description = "DC1_VPN0"
  device_types = ["vedge-C8000V"]
  vpn_id = 0
  dns_ipv4_servers =   [
    {
      address = "198.18.133.1",
      role = "primary",
    }
  ]
  ipv4_static_routes =   [
    {
      next_hops = [
        {
          address = "209.165.201.30",
        },
        {
          address = "192.168.20.254",
        }
      ],
      prefix = "0.0.0.0/0",
    }
  ]
}

resource "sdwan_cisco_vpn_feature_template" "DC1_VPN10" {
  # id = "11788b4d-4e24-41c2-84d2-d4e50fde3a03"
  name = "DC1_VPN10"
  description = "DC1_VPN10"
  device_types = ["vedge-C8000V"]
  vpn_id = 10
  omp_advertise_ipv4_routes =   [
    {
      protocol = "bgp",
    }
  ]
}

resource "sdwan_cisco_vpn_feature_template" "DC2_VPN0" {
  # id = "1f8284e2-025f-48eb-a05a-a3f7c3e6029b"
  name = "DC2_VPN0"
  description = "DC2_VPN0"
  device_types = ["vedge-C8000V"]
  vpn_id = 0
  dns_ipv4_servers =   [
    {
      address = "198.18.133.1",
      role = "primary",
    }
  ]
  ipv4_static_routes =   [
    {
      next_hops = [
        {
          address = "209.165.201.30",
        },
        {
          address = "192.168.20.254",
        }
      ],
      prefix = "0.0.0.0/0",
    }
  ]
}

resource "sdwan_cisco_vpn_feature_template" "DC2_VPN10" {
  # id = "0122382d-acd0-4da8-bf3b-9e27b26a8919"
  name = "DC2_VPN10"
  description = "DC2_VPN10"
  device_types = ["vedge-C8000V"]
  vpn_id = 10
  omp_advertise_ipv4_routes =   [
    {
      protocol = "bgp",
    }
  ]
}

resource "sdwan_cisco_vpn_feature_template" "Global_VPN512" {
  # id = "41454684-8440-4da1-a51d-6b5c395003b1"
  name = "Global_VPN512"
  description = "Global_VPN512"
  device_types = ["vedge-C8000V"]
  vpn_id = 512
}

resource "sdwan_cisco_vpn_interface_feature_template" "Branch1_Edge1_TLOC_Ext" {
  # id = "55752c8f-79bd-4957-a420-986573a97dbe"
  name = "Branch1_Edge1_TLOC_Ext"
  description = "Branch1_TLOC_Ext"
  device_types = ["vedge-C8000V"]
  address = "192.168.100.1/30"
  interface_name = "GigabitEthernet2"
  shutdown = "false"
  tunnel_interface_color = "biz-internet"
  tunnel_interface_encapsulations =   [
    {
      encapsulation = "ipsec",
    }
  ]
  tunnel_interface_gre_tunnel_destination_ip = "192.168.100.2"
}

resource "sdwan_cisco_vpn_interface_feature_template" "Branch1_Edge2_TLOC_Ext" {
  # id = "6d2942b2-fdfe-4c13-8702-14ed8a782a4b"
  name = "Branch1_Edge2_TLOC_Ext"
  description = "Branch1_TLOC_Ext"
  device_types = ["vedge-C8000V"]
  address = "192.168.100.2/30"
  gre_tunnel_source_ip = "192.168.100.1"
  gre_tunnel_xconnect = "GigabitEthernet1"
  interface_name = "GigabitEthernet3"
  shutdown = "false"
}

resource "sdwan_cisco_vpn_interface_feature_template" "Branch1_VPN0_INET" {
  # id = "1f7e6d12-5a6e-4275-842f-61f5810cd446"
  name = "Branch1_VPN0_INET"
  description = "Branch1_VPN0_INET"
  device_types = ["vedge-C8000V"]
  address_variable = "vpn0_biz-inet_ipv4_address"
  interface_name_variable = "vpn0_biz-inet_name"
  shutdown = "false"
  tunnel_interface_allow_ospf = "true"
  tunnel_interface_color = "biz-internet"
  tunnel_interface_color_restrict = "false"
  tunnel_interface_encapsulations =   [
    {
      encapsulation = "ipsec",
    }
  ]
}

resource "sdwan_cisco_vpn_interface_feature_template" "Branch1_VPN0_LTE" {
  # id = "cedf9eed-810a-48f0-a478-9cd0ffac9af7"
  name = "Branch1_VPN0_LTE"
  description = "Branch1_VPN0_LTE"
  device_types = ["vedge-C8000V"]
  address_variable = "vpn0_lte_ipv4_address"
  interface_name_variable = "vpn0_lte_if_name"
  shutdown = "false"
  tunnel_interface_color = "lte"
  tunnel_interface_encapsulations =   [
    {
      encapsulation = "ipsec",
    }
  ]
}

resource "sdwan_cisco_vpn_interface_feature_template" "Branch1_VPN0_MPLS" {
  # id = "8d40dcf8-67b9-43a2-b6b7-8d1f8b10adc2"
  name = "Branch1_VPN0_MPLS"
  description = "Branch1_VPN0_MPLS"
  device_types = ["vedge-C8000V"]
  address_variable = "vpn0_mpls_ipv4_address"
  interface_name_variable = "vpn0_mpls_if_name"
  shutdown = "false"
  tunnel_interface_color = "mpls"
  tunnel_interface_color_restrict = "true"
  tunnel_interface_encapsulations =   [
    {
      encapsulation = "ipsec",
    }
  ]
}

resource "sdwan_cisco_vpn_interface_feature_template" "Branch1_VPN10_Interface" {
  # id = "c6b743bd-61fa-4de1-a5dc-efd9937b5ee5"
  name = "Branch1_VPN10_Interface"
  description = "Branch1_VPN10_Interface"
  device_types = ["vedge-C8000V"]
  address_variable = "vpn10_if_ipv4_address"
  interface_name_variable = "vpn10_if_name"
  shutdown = "false"
}

resource "sdwan_cisco_vpn_interface_feature_template" "Branch2_VPN0_Gig1_mpls" {
  # id = "1a836ed5-dd2f-4958-9c68-864481ccdacf"
  name = "Branch2_VPN0_Gig1_mpls"
  description = "Branch2_VPN0_Gig1_mpls"
  device_types = ["vedge-C8000V"]
  address_variable = "vpn0_mpls_ipv4_address"
  interface_name = "GigabitEthernet1"
  shutdown = "false"
  tunnel_interface_color = "mpls"
  tunnel_interface_color_restrict = "true"
  tunnel_interface_encapsulations =   [
    {
      encapsulation = "ipsec",
    }
  ]
}

resource "sdwan_cisco_vpn_interface_feature_template" "Branch2_VPN0_Gig2_inet" {
  # id = "f97d60da-28b1-4476-86ce-90e0b00fe8ce"
  name = "Branch2_VPN0_Gig2_inet"
  description = "Branch2_VPN0_Gig2_inet"
  device_types = ["vedge-C8000V"]
  address_variable = "vpn0_inet_ipv4_address"
  interface_name = "GigabitEthernet2"
  shutdown = "false"
  tunnel_interface_color = "biz-internet"
  tunnel_interface_encapsulations =   [
    {
      encapsulation = "ipsec",
    }
  ]
}

resource "sdwan_cisco_vpn_interface_feature_template" "Branch2_VPN0_Gig3_lte" {
  # id = "399c5e8f-c97b-4d2a-83cd-6f434ed87e8c"
  name = "Branch2_VPN0_Gig3_lte"
  description = "Branch2_VPN0_Gig3_lte"
  device_types = ["vedge-C8000V"]
  address_variable = "vpn0_lte_ipv4_address"
  interface_name = "GigabitEthernet3"
  shutdown = "false"
  tunnel_interface_color = "lte"
  tunnel_interface_encapsulations =   [
    {
      encapsulation = "ipsec",
    }
  ]
}

resource "sdwan_cisco_vpn_interface_feature_template" "Branch2_VPN10_Interface" {
  # id = "e1241d63-b474-4637-abfd-19401237b6b6"
  name = "Branch2_VPN10_Interface"
  description = "Branch2_VPN10_Interface"
  device_types = ["vedge-C8000V"]
  address_variable = "vpn10_if_ipv4_address"
  interface_name = "GigabitEthernet4"
  ipv4_vrrps =   [
    {
      group_id = 102,
      ip_address = "10.10.102.1",
    }
  ]
  shutdown_variable = "vpn10_gig4_shutdown"
}

resource "sdwan_cisco_vpn_interface_feature_template" "Branch3_VPN0_Gig1_mpls" {
  # id = "230bb6b3-b850-43c0-986f-6bc07ebb3575"
  name = "Branch3_VPN0_Gig1_mpls"
  description = "Branch3_VPN0_Gig1_mpls"
  device_types = ["vedge-C8000V"]
  address_variable = "vpn0_mpls_ipv4_address"
  interface_name = "GigabitEthernet1"
  shutdown = "false"
  tunnel_interface_color = "mpls"
  tunnel_interface_color_restrict = "true"
  tunnel_interface_encapsulations =   [
    {
      encapsulation = "ipsec",
    }
  ]
}

resource "sdwan_cisco_vpn_interface_feature_template" "Branch3_VPN0_Gig2_inet" {
  # id = "dac7dec9-bbdf-42c9-8f77-8ef6dbe15e63"
  name = "Branch3_VPN0_Gig2_inet"
  description = "Branch3_VPN0_Gig2_inet"
  device_types = ["vedge-C8000V"]
  address_variable = "vpn0_inet_ipv4_address"
  interface_name = "GigabitEthernet2"
  shutdown = "false"
  tunnel_interface_color = "biz-internet"
  tunnel_interface_encapsulations =   [
    {
      encapsulation = "ipsec",
    }
  ]
}

resource "sdwan_cisco_vpn_interface_feature_template" "Branch3_VPN0_Gig3_lte" {
  # id = "0e96b039-433a-40f5-9fb4-9b17b0dc88be"
  name = "Branch3_VPN0_Gig3_lte"
  description = "Branch3_VPN0_Gig3_lte"
  device_types = ["vedge-C8000V"]
  address_variable = "vpn0_lte_ipv4_address"
  interface_name = "GigabitEthernet3"
  shutdown = "false"
  tunnel_interface_color = "lte"
  tunnel_interface_encapsulations =   [
    {
      encapsulation = "ipsec",
    }
  ]
}

resource "sdwan_cisco_vpn_interface_feature_template" "Branch3_VPN10_FW_Interface" {
  # id = "3a6e0fe3-5c7f-4913-9be8-b6cba4655512"
  name = "Branch3_VPN10_FW_Interface"
  description = "Branch3_VPN10_FW_Interface"
  device_types = ["vedge-C8000V"]
  address_variable = "vpn10_fw_if_ipv4_address"
  interface_name = "GigabitEthernet5"
  shutdown = "false"
}

resource "sdwan_cisco_vpn_interface_feature_template" "Branch3_VPN10_Interface" {
  # id = "2e510e44-1179-4101-810f-4bbeb0be7b07"
  name = "Branch3_VPN10_Interface"
  description = "Branch3_VPN10_Interface"
  device_types = ["vedge-C8000V"]
  address_variable = "vpn10_if_ipv4_address"
  interface_name = "GigabitEthernet4"
  shutdown = "false"
}

resource "sdwan_cisco_vpn_interface_feature_template" "DC1_VPN0_Gig1" {
  # id = "e1cc379e-6c98-403a-a384-86c5d4e3b05a"
  name = "DC1_VPN0_Gig1"
  description = "DC1_VPN0_Gig1"
  device_types = ["vedge-C8000V"]
  address_variable = "vpn0_gig1_ipv4_address"
  interface_name = "GigabitEthernet1"
  shutdown = "false"
  tunnel_interface_color = "biz-internet"
  tunnel_interface_encapsulations =   [
    {
      encapsulation = "ipsec",
    }
  ]
}

resource "sdwan_cisco_vpn_interface_feature_template" "DC1_VPN0_Gig2" {
  # id = "49917dc0-cde7-4346-851a-42707e04e6a7"
  name = "DC1_VPN0_Gig2"
  description = "DC1_VPN0_Gig2_MPLS"
  device_types = ["vedge-C8000V"]
  address_variable = "vpn0_gig2_ipv4_address"
  interface_name = "GigabitEthernet2"
  shutdown = "false"
  tunnel_interface_color = "mpls"
  tunnel_interface_color_restrict = "true"
  tunnel_interface_encapsulations =   [
    {
      encapsulation = "ipsec",
    }
  ]
}

resource "sdwan_cisco_vpn_interface_feature_template" "DC1_VPN10_Gig3" {
  # id = "51e220ba-745e-45a4-8dee-503a0316e61e"
  name = "DC1_VPN10_Gig3"
  description = "DC1_VPN10_Gig3"
  device_types = ["vedge-C8000V"]
  address_variable = "vpn10_gig3_ipv4_address"
  interface_name = "GigabitEthernet3"
  shutdown = "false"
}

resource "sdwan_cisco_vpn_interface_feature_template" "DC2_VPN0_Gig1" {
  # id = "11169b94-c14d-42e9-b4de-bdddd16c6253"
  name = "DC2_VPN0_Gig1"
  description = "DC2_VPN0_Gig1"
  device_types = ["vedge-C8000V"]
  address_variable = "vpn0_gig1_ipv4_address"
  interface_name = "GigabitEthernet1"
  shutdown = "false"
  tunnel_interface_color = "biz-internet"
  tunnel_interface_encapsulations =   [
    {
      encapsulation = "ipsec",
    }
  ]
}

resource "sdwan_cisco_vpn_interface_feature_template" "DC2_VPN0_Gig2" {
  # id = "5dd8fed1-5051-4246-b666-00e9e4a83bd4"
  name = "DC2_VPN0_Gig2"
  description = "DC2_VPN0_Gig2_MPLS"
  device_types = ["vedge-C8000V"]
  address_variable = "vpn0_gig2_ipv4_address"
  interface_name = "GigabitEthernet2"
  shutdown = "false"
  tunnel_interface_color = "mpls"
  tunnel_interface_color_restrict = "true"
  tunnel_interface_encapsulations =   [
    {
      encapsulation = "ipsec",
    }
  ]
}

resource "sdwan_cisco_vpn_interface_feature_template" "DC2_VPN10_Gig3" {
  # id = "f5d90e4b-ffb0-49a2-b969-02d35a35a32a"
  name = "DC2_VPN10_Gig3"
  description = "DC2_VPN10_Gig3"
  device_types = ["vedge-C8000V"]
  address_variable = "vpn10_gig3_ipv4_address"
  interface_name = "GigabitEthernet3"
  shutdown = "false"
}

resource "sdwan_cisco_vpn_interface_feature_template" "Global_VPN512_interface" {
  # id = "6d758ee1-a24d-477b-822f-7a3133aae6ec"
  name = "Global_VPN512_interface"
  description = "Global_VPN512_interface"
  device_types = ["vedge-C8000V"]
  address_variable = "vpn512_if_ipv4_address"
  interface_description_variable = "vpn512_if_description"
  interface_name_variable = "vpn512_if_name"
  shutdown = "false"
}

resource "sdwan_eigrp_feature_template" "Branch3_EIGRP" {
  # id = "a441302f-9c6f-4f9f-b9c7-2531af99d703"
  name = "Branch3_EIGRP"
  description = "Branch3_EIGRP"
  device_types = ["vedge-C8000V"]
  address_families =   [
    {
      networks = [
        {
          prefix = "172.16.103.0/30",
        },
        {
          prefix = "10.50.50.0/24",
        }
      ],
      redistributes = [
        {
          protocol = "omp",
        }
      ],
      type = "ipv4"
    }
  ]
  as_number = 103
  interfaces =   [
    {
      interface_name = "GigabitEthernet4",
    }
  ]
}
