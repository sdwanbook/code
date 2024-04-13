resource "sdwan_feature_device_template" "Branch1_Edge1" {
  # id = "a8872506-b4a0-4b2d-87db-0ea665bec0bd"
  name = "Branch1_Edge1"
  description = "Branch1_Edge1"
  device_role = "sdwan-edge"
  device_type = "vedge-C8000V"
  general_templates =   [
    {
      id = sdwan_cisco_omp_feature_template.Global_OMP.id,
      version = sdwan_cisco_omp_feature_template.Global_OMP.version,
      type = "cisco_omp",
    },
    {
      id = sdwan_cisco_vpn_feature_template.Global_VPN512.id,
      version = sdwan_cisco_vpn_feature_template.Global_VPN512.version,
      sub_templates = [
        {
          id = sdwan_cisco_vpn_interface_feature_template.Global_VPN512_interface.id,
          version = sdwan_cisco_vpn_interface_feature_template.Global_VPN512_interface.version,
          type = "cisco_vpn_interface",
        }
      ],
      type = "cisco_vpn",
    },
    {
      id = sdwan_cisco_security_feature_template.Default_Security_Cisco_V01.id,
      version = sdwan_cisco_security_feature_template.Default_Security_Cisco_V01.version,
      type = "cisco_security",
    },
    {
      id = sdwan_cisco_vpn_feature_template.Branch1_VPN10.id,
      version = sdwan_cisco_vpn_feature_template.Branch1_VPN10.version,
      sub_templates = [
        {
          id = sdwan_cisco_vpn_interface_feature_template.Branch1_VPN10_Interface.id,
          version = sdwan_cisco_vpn_interface_feature_template.Branch1_VPN10_Interface.version,
          type = "cisco_vpn_interface",
        },
        {
          id = sdwan_cisco_ospf_feature_template.Branch1_VPN10_OSPF.id,
          version = sdwan_cisco_ospf_feature_template.Branch1_VPN10_OSPF.version,
          type = "cisco_ospf",
        }
      ],
      type = "cisco_vpn",
    },
    {
      id = sdwan_cisco_vpn_feature_template.Branch1_VPN0_Edge1.id,
      version = sdwan_cisco_vpn_feature_template.Branch1_VPN0_Edge1.version,
      sub_templates = [
        {
          id = sdwan_cisco_vpn_interface_feature_template.Branch1_Edge1_TLOC_Ext.id,
          version = sdwan_cisco_vpn_interface_feature_template.Branch1_Edge1_TLOC_Ext.version,
          type = "cisco_vpn_interface",
        },
        {
          id = sdwan_cisco_vpn_interface_feature_template.Branch1_VPN0_MPLS.id,
          version = sdwan_cisco_vpn_interface_feature_template.Branch1_VPN0_MPLS.version,
          type = "cisco_vpn_interface",
        }
      ],
      type = "cisco_vpn",
    },
    {
      id = sdwan_cisco_bfd_feature_template.Default_BFD_Cisco_V01.id,
      version = sdwan_cisco_bfd_feature_template.Default_BFD_Cisco_V01.version,
      type = "cisco_bfd",
    },
    {
      id = sdwan_cisco_system_feature_template.Global_System.id,
      version = sdwan_cisco_system_feature_template.Global_System.version,
      sub_templates = [
        {
          id = sdwan_cisco_logging_feature_template.Default_Logging_Cisco_V01.id,
          version = sdwan_cisco_logging_feature_template.Default_Logging_Cisco_V01.version,
          type = "cisco_logging",
        }
      ],
      type = "cisco_system",
    },
    {
      id = sdwan_cedge_global_feature_template.Default_EQUINIX_C8000V_GLOBAL_CISCO_V01.id,
      version = sdwan_cedge_global_feature_template.Default_EQUINIX_C8000V_GLOBAL_CISCO_V01.version,
      type = "cedge_global",
    },
    {
      id = sdwan_cedge_aaa_feature_template.Global_AAA.id,
      version = sdwan_cedge_aaa_feature_template.Global_AAA.version,
      type = "cedge_aaa",
    },
    {
      id = sdwan_cisco_banner_feature_template.Factory_Default_Retail_Banner.id,
      version = sdwan_cisco_banner_feature_template.Factory_Default_Retail_Banner.version,
      type = "cisco_banner",
    }
  ]
}

resource "sdwan_feature_device_template" "Branch1_Edge2" {
  # id = "0d420e42-a39e-42b4-b5ba-e91d29efbec8"
  name = "Branch1_Edge2"
  description = "Branch1_Edge2"
  device_role = "sdwan-edge"
  device_type = "vedge-C8000V"
  general_templates =   [
    {
      id = sdwan_cisco_omp_feature_template.Global_OMP.id,
      version = sdwan_cisco_omp_feature_template.Global_OMP.version,
      type = "cisco_omp",
    },
    {
      id = sdwan_cisco_vpn_feature_template.Global_VPN512.id,
      version = sdwan_cisco_vpn_feature_template.Global_VPN512.version,
      sub_templates = [
        {
          id = sdwan_cisco_vpn_interface_feature_template.Global_VPN512_interface.id,
          version = sdwan_cisco_vpn_interface_feature_template.Global_VPN512_interface.version,
          type = "cisco_vpn_interface",
        }
      ],
      type = "cisco_vpn",
    },
    {
      id = sdwan_cisco_security_feature_template.Default_Security_Cisco_V01.id,
      version = sdwan_cisco_security_feature_template.Default_Security_Cisco_V01.version,
      type = "cisco_security",
    },
    {
      id = sdwan_cisco_vpn_feature_template.Branch1_VPN0_Edge2.id,
      version = sdwan_cisco_vpn_feature_template.Branch1_VPN0_Edge2.version,
      sub_templates = [
        {
          id = sdwan_cisco_ospf_feature_template.Branch1_VPN0_OSPF.id,
          version = sdwan_cisco_ospf_feature_template.Branch1_VPN0_OSPF.version,
          type = "cisco_ospf",
        },
        {
          id = sdwan_cisco_vpn_interface_feature_template.Branch1_VPN0_INET.id,
          version = sdwan_cisco_vpn_interface_feature_template.Branch1_VPN0_INET.version,
          type = "cisco_vpn_interface",
        },
        {
          id = sdwan_cisco_vpn_interface_feature_template.Branch1_Edge2_TLOC_Ext.id,
          version = sdwan_cisco_vpn_interface_feature_template.Branch1_Edge2_TLOC_Ext.version,
          type = "cisco_vpn_interface",
        },
        {
          id = sdwan_cisco_vpn_interface_feature_template.Branch1_VPN0_LTE.id,
          version = sdwan_cisco_vpn_interface_feature_template.Branch1_VPN0_LTE.version,
          type = "cisco_vpn_interface",
        }
      ],
      type = "cisco_vpn",
    },
    {
      id = sdwan_cisco_vpn_feature_template.Branch1_VPN10.id,
      version = sdwan_cisco_vpn_feature_template.Branch1_VPN10.version,
      sub_templates = [
        {
          id = sdwan_cisco_vpn_interface_feature_template.Branch1_VPN10_Interface.id,
          version = sdwan_cisco_vpn_interface_feature_template.Branch1_VPN10_Interface.version,
          type = "cisco_vpn_interface",
        },
        {
          id = sdwan_cisco_ospf_feature_template.Branch1_VPN10_OSPF.id,
          version = sdwan_cisco_ospf_feature_template.Branch1_VPN10_OSPF.version,
          type = "cisco_ospf",
        }
      ],
      type = "cisco_vpn",
    },
    {
      id = sdwan_cisco_bfd_feature_template.Default_BFD_Cisco_V01.id,
      version = sdwan_cisco_bfd_feature_template.Default_BFD_Cisco_V01.version,
      type = "cisco_bfd",
    },
    {
      id = sdwan_cisco_system_feature_template.Global_System.id,
      version = sdwan_cisco_system_feature_template.Global_System.version,
      sub_templates = [
        {
          id = sdwan_cisco_logging_feature_template.Default_Logging_Cisco_V01.id,
          version = sdwan_cisco_logging_feature_template.Default_Logging_Cisco_V01.version,
          type = "cisco_logging",
        }
      ],
      type = "cisco_system",
    },
    {
      id = sdwan_cedge_global_feature_template.Default_EQUINIX_C8000V_GLOBAL_CISCO_V01.id,
      version = sdwan_cedge_global_feature_template.Default_EQUINIX_C8000V_GLOBAL_CISCO_V01.version,
      type = "cedge_global",
    },
    {
      id = sdwan_cedge_aaa_feature_template.Global_AAA.id,
      version = sdwan_cedge_aaa_feature_template.Global_AAA.version,
      type = "cedge_aaa",
    },
    {
      id = sdwan_cisco_banner_feature_template.Factory_Default_Retail_Banner.id,
      version = sdwan_cisco_banner_feature_template.Factory_Default_Retail_Banner.version,
      type = "cisco_banner",
    }
  ]
}

resource "sdwan_feature_device_template" "Branch2_Edge" {
  # id = "a045ffb5-f8e7-420a-a5ea-39eb597b702b"
  name = "Branch2_Edge"
  description = "Branch2_Edge"
  device_role = "sdwan-edge"
  device_type = "vedge-C8000V"
  general_templates =   [
    {
      id = sdwan_cisco_omp_feature_template.Global_OMP.id,
      version = sdwan_cisco_omp_feature_template.Global_OMP.version,
      type = "cisco_omp",
    },
    {
      id = sdwan_cisco_vpn_feature_template.Global_VPN512.id,
      version = sdwan_cisco_vpn_feature_template.Global_VPN512.version,
      sub_templates = [
        {
          id = sdwan_cisco_vpn_interface_feature_template.Global_VPN512_interface.id,
          version = sdwan_cisco_vpn_interface_feature_template.Global_VPN512_interface.version,
          type = "cisco_vpn_interface",
        }
      ],
      type = "cisco_vpn",
    },
    {
      id = sdwan_cisco_security_feature_template.Default_Security_Cisco_V01.id,
      version = sdwan_cisco_security_feature_template.Default_Security_Cisco_V01.version,
      type = "cisco_security",
    },
    {
      id = sdwan_cisco_bfd_feature_template.Default_BFD_Cisco_V01.id,
      version = sdwan_cisco_bfd_feature_template.Default_BFD_Cisco_V01.version,
      type = "cisco_bfd",
    },
    {
      id = sdwan_cisco_system_feature_template.Global_System.id,
      version = sdwan_cisco_system_feature_template.Global_System.version,
      sub_templates = [
        {
          id = sdwan_cisco_logging_feature_template.Default_Logging_Cisco_V01.id,
          version = sdwan_cisco_logging_feature_template.Default_Logging_Cisco_V01.version,
          type = "cisco_logging",
        }
      ],
      type = "cisco_system",
    },
    {
      id = sdwan_cedge_global_feature_template.Default_EQUINIX_C8000V_GLOBAL_CISCO_V01.id,
      version = sdwan_cedge_global_feature_template.Default_EQUINIX_C8000V_GLOBAL_CISCO_V01.version,
      type = "cedge_global",
    },
    {
      id = sdwan_cisco_vpn_feature_template.Branch2_VPN0.id,
      version = sdwan_cisco_vpn_feature_template.Branch2_VPN0.version,
      sub_templates = [
        {
          id = sdwan_cisco_vpn_interface_feature_template.Branch2_VPN0_Gig1_mpls.id,
          version = sdwan_cisco_vpn_interface_feature_template.Branch2_VPN0_Gig1_mpls.version,
          type = "cisco_vpn_interface",
        },
        {
          id = sdwan_cisco_vpn_interface_feature_template.Branch2_VPN0_Gig3_lte.id,
          version = sdwan_cisco_vpn_interface_feature_template.Branch2_VPN0_Gig3_lte.version,
          type = "cisco_vpn_interface",
        },
        {
          id = sdwan_cisco_vpn_interface_feature_template.Branch2_VPN0_Gig2_inet.id,
          version = sdwan_cisco_vpn_interface_feature_template.Branch2_VPN0_Gig2_inet.version,
          type = "cisco_vpn_interface",
        }
      ],
      type = "cisco_vpn",
    },
    {
      id = sdwan_cedge_aaa_feature_template.Global_AAA.id,
      version = sdwan_cedge_aaa_feature_template.Global_AAA.version,
      type = "cedge_aaa",
    },
    {
      id = sdwan_cisco_vpn_feature_template.Branch2_VPN10.id,
      version = sdwan_cisco_vpn_feature_template.Branch2_VPN10.version,
      sub_templates = [
        {
          id = sdwan_cisco_vpn_interface_feature_template.Branch2_VPN10_Interface.id,
          version = sdwan_cisco_vpn_interface_feature_template.Branch2_VPN10_Interface.version,
          type = "cisco_vpn_interface",
        }
      ],
      type = "cisco_vpn",
    },
    {
      id = sdwan_cisco_banner_feature_template.Factory_Default_Retail_Banner.id,
      version = sdwan_cisco_banner_feature_template.Factory_Default_Retail_Banner.version,
      type = "cisco_banner",
    }
  ]
}

resource "sdwan_feature_device_template" "Branch3_Edge" {
  # id = "e52459b3-6fdf-43fd-9e2c-7108a459d85f"
  name = "Branch3_Edge"
  description = "Branch3_Edge"
  device_role = "sdwan-edge"
  device_type = "vedge-C8000V"
  general_templates =   [
    {
      id = sdwan_cisco_vpn_feature_template.Branch3_VPN10.id,
      version = sdwan_cisco_vpn_feature_template.Branch3_VPN10.version,
      sub_templates = [
        {
          id = sdwan_cisco_vpn_interface_feature_template.Branch3_VPN10_Interface.id,
          version = sdwan_cisco_vpn_interface_feature_template.Branch3_VPN10_Interface.version,
          type = "cisco_vpn_interface",
        },
        {
          id = sdwan_cisco_vpn_interface_feature_template.Branch3_VPN10_FW_Interface.id,
          version = sdwan_cisco_vpn_interface_feature_template.Branch3_VPN10_FW_Interface.version,
          type = "cisco_vpn_interface",
        },
        {
          id = sdwan_eigrp_feature_template.Branch3_EIGRP.id,
          version = sdwan_eigrp_feature_template.Branch3_EIGRP.version,
          type = "eigrp",
        }
      ],
      type = "cisco_vpn",
    },
    {
      id = sdwan_cisco_omp_feature_template.Global_OMP.id,
      version = sdwan_cisco_omp_feature_template.Global_OMP.version,
      type = "cisco_omp",
    },
    {
      id = sdwan_cisco_vpn_feature_template.Global_VPN512.id,
      version = sdwan_cisco_vpn_feature_template.Global_VPN512.version,
      sub_templates = [
        {
          id = sdwan_cisco_vpn_interface_feature_template.Global_VPN512_interface.id,
          version = sdwan_cisco_vpn_interface_feature_template.Global_VPN512_interface.version,
          type = "cisco_vpn_interface",
        }
      ],
      type = "cisco_vpn",
    },
    {
      id = sdwan_cisco_security_feature_template.Default_Security_Cisco_V01.id,
      version = sdwan_cisco_security_feature_template.Default_Security_Cisco_V01.version,
      type = "cisco_security",
    },
    {
      id = sdwan_cisco_bfd_feature_template.Default_BFD_Cisco_V01.id,
      version = sdwan_cisco_bfd_feature_template.Default_BFD_Cisco_V01.version,
      type = "cisco_bfd",
    },
    {
      id = sdwan_cisco_system_feature_template.Global_System.id,
      version = sdwan_cisco_system_feature_template.Global_System.version,
      sub_templates = [
        {
          id = sdwan_cisco_logging_feature_template.Default_Logging_Cisco_V01.id,
          version = sdwan_cisco_logging_feature_template.Default_Logging_Cisco_V01.version,
          type = "cisco_logging",
        }
      ],
      type = "cisco_system",
    },
    {
      id = sdwan_cedge_global_feature_template.Default_EQUINIX_C8000V_GLOBAL_CISCO_V01.id,
      version = sdwan_cedge_global_feature_template.Default_EQUINIX_C8000V_GLOBAL_CISCO_V01.version,
      type = "cedge_global",
    },
    {
      id = sdwan_cedge_aaa_feature_template.Global_AAA.id,
      version = sdwan_cedge_aaa_feature_template.Global_AAA.version,
      type = "cedge_aaa",
    },
    {
      id = sdwan_cisco_vpn_feature_template.Branch3_VPN0.id,
      version = sdwan_cisco_vpn_feature_template.Branch3_VPN0.version,
      sub_templates = [
        {
          id = sdwan_cisco_vpn_interface_feature_template.Branch3_VPN0_Gig3_lte.id,
          version = sdwan_cisco_vpn_interface_feature_template.Branch3_VPN0_Gig3_lte.version,
          type = "cisco_vpn_interface",
        },
        {
          id = sdwan_cisco_vpn_interface_feature_template.Branch3_VPN0_Gig1_mpls.id,
          version = sdwan_cisco_vpn_interface_feature_template.Branch3_VPN0_Gig1_mpls.version,
          type = "cisco_vpn_interface",
        },
        {
          id = sdwan_cisco_vpn_interface_feature_template.Branch3_VPN0_Gig2_inet.id,
          version = sdwan_cisco_vpn_interface_feature_template.Branch3_VPN0_Gig2_inet.version,
          type = "cisco_vpn_interface",
        }
      ],
      type = "cisco_vpn",
    },
    {
      id = sdwan_cisco_banner_feature_template.Factory_Default_Retail_Banner.id,
      version = sdwan_cisco_banner_feature_template.Factory_Default_Retail_Banner.version,
      type = "cisco_banner",
    }
  ]
}

resource "sdwan_feature_device_template" "DC1_Edge" {
  # id = "57dfe544-75d8-40ea-942b-09b63ebfc800"
  name = "DC1_Edge"
  description = "WAN Edge routers in Primary Data Center"
  device_role = "sdwan-edge"
  device_type = "vedge-C8000V"
  general_templates =   [
    {
      id = sdwan_cisco_vpn_feature_template.DC1_VPN10.id,
      version = sdwan_cisco_vpn_feature_template.DC1_VPN10.version,
      sub_templates = [
        {
          id = sdwan_cisco_bgp_feature_template.DC1_BGP.id,
          version = sdwan_cisco_bgp_feature_template.DC1_BGP.version,
          type = "cisco_bgp",
        },
        {
          id = sdwan_cisco_vpn_interface_feature_template.DC1_VPN10_Gig3.id,
          version = sdwan_cisco_vpn_interface_feature_template.DC1_VPN10_Gig3.version,
          type = "cisco_vpn_interface",
        }
      ],
      type = "cisco_vpn",
    },
    {
      id = sdwan_cisco_omp_feature_template.Global_OMP.id,
      version = sdwan_cisco_omp_feature_template.Global_OMP.version,
      type = "cisco_omp",
    },
    {
      id = sdwan_cisco_vpn_feature_template.Global_VPN512.id,
      version = sdwan_cisco_vpn_feature_template.Global_VPN512.version,
      sub_templates = [
        {
          id = sdwan_cisco_vpn_interface_feature_template.Global_VPN512_interface.id,
          version = sdwan_cisco_vpn_interface_feature_template.Global_VPN512_interface.version,
          type = "cisco_vpn_interface",
        }
      ],
      type = "cisco_vpn",
    },
    {
      id = sdwan_cisco_security_feature_template.Default_Security_Cisco_V01.id,
      version = sdwan_cisco_security_feature_template.Default_Security_Cisco_V01.version,
      type = "cisco_security",
    },
    {
      id = sdwan_cisco_bfd_feature_template.Default_BFD_Cisco_V01.id,
      version = sdwan_cisco_bfd_feature_template.Default_BFD_Cisco_V01.version,
      type = "cisco_bfd",
    },
    {
      id = sdwan_cisco_system_feature_template.Global_System.id,
      version = sdwan_cisco_system_feature_template.Global_System.version,
      sub_templates = [
        {
          id = sdwan_cisco_logging_feature_template.Default_Logging_Cisco_V01.id,
          version = sdwan_cisco_logging_feature_template.Default_Logging_Cisco_V01.version,
          type = "cisco_logging",
        }
      ],
      type = "cisco_system",
    },
    {
      id = sdwan_cedge_global_feature_template.Default_EQUINIX_C8000V_GLOBAL_CISCO_V01.id,
      version = sdwan_cedge_global_feature_template.Default_EQUINIX_C8000V_GLOBAL_CISCO_V01.version,
      type = "cedge_global",
    },
    {
      id = sdwan_cedge_aaa_feature_template.Global_AAA.id,
      version = sdwan_cedge_aaa_feature_template.Global_AAA.version,
      type = "cedge_aaa",
    },
    {
      id = sdwan_cisco_vpn_feature_template.DC1_VPN0.id,
      version = sdwan_cisco_vpn_feature_template.DC1_VPN0.version,
      sub_templates = [
        {
          id = sdwan_cisco_vpn_interface_feature_template.DC1_VPN0_Gig2.id,
          version = sdwan_cisco_vpn_interface_feature_template.DC1_VPN0_Gig2.version,
          type = "cisco_vpn_interface",
        },
        {
          id = sdwan_cisco_vpn_interface_feature_template.DC1_VPN0_Gig1.id,
          version = sdwan_cisco_vpn_interface_feature_template.DC1_VPN0_Gig1.version,
          type = "cisco_vpn_interface",
        }
      ],
      type = "cisco_vpn",
    },
    {
      id = sdwan_cisco_banner_feature_template.Factory_Default_Retail_Banner.id,
      version = sdwan_cisco_banner_feature_template.Factory_Default_Retail_Banner.version,
      type = "cisco_banner",
    }
  ]
}

resource "sdwan_feature_device_template" "DC2_Edge" {
  # id = "77ab7c58-9173-4523-9c11-49ca117dfb77"
  name = "DC2_Edge"
  description = "DC2_Edge"
  device_role = "sdwan-edge"
  device_type = "vedge-C8000V"
  general_templates =   [
    {
      id = sdwan_cisco_vpn_feature_template.DC2_VPN10.id,
      version = sdwan_cisco_vpn_feature_template.DC2_VPN10.version,
      sub_templates = [
        {
          id = sdwan_cisco_bgp_feature_template.DC2_BGP.id,
          version = sdwan_cisco_bgp_feature_template.DC2_BGP.version,
          type = "cisco_bgp",
        },
        {
          id = sdwan_cisco_vpn_interface_feature_template.DC2_VPN10_Gig3.id,
          version = sdwan_cisco_vpn_interface_feature_template.DC2_VPN10_Gig3.version,
          type = "cisco_vpn_interface",
        }
      ],
      type = "cisco_vpn",
    },
    {
      id = sdwan_cisco_vpn_feature_template.DC2_VPN0.id,
      version = sdwan_cisco_vpn_feature_template.DC2_VPN0.version,
      sub_templates = [
        {
          id = sdwan_cisco_vpn_interface_feature_template.DC2_VPN0_Gig1.id,
          version = sdwan_cisco_vpn_interface_feature_template.DC2_VPN0_Gig1.version,
          type = "cisco_vpn_interface",
        },
        {
          id = sdwan_cisco_vpn_interface_feature_template.DC2_VPN0_Gig2.id,
          version = sdwan_cisco_vpn_interface_feature_template.DC2_VPN0_Gig2.version,
          type = "cisco_vpn_interface",
        }
      ],
      type = "cisco_vpn",
    },
    {
      id = sdwan_cisco_omp_feature_template.Global_OMP.id,
      version = sdwan_cisco_omp_feature_template.Global_OMP.version,
      type = "cisco_omp",
    },
    {
      id = sdwan_cisco_vpn_feature_template.Global_VPN512.id,
      version = sdwan_cisco_vpn_feature_template.Global_VPN512.version,
      sub_templates = [
        {
          id = sdwan_cisco_vpn_interface_feature_template.Global_VPN512_interface.id,
          version = sdwan_cisco_vpn_interface_feature_template.Global_VPN512_interface.version,
          type = "cisco_vpn_interface",
        }
      ],
      type = "cisco_vpn",
    },
    {
      id = sdwan_cisco_security_feature_template.Default_Security_Cisco_V01.id,
      version = sdwan_cisco_security_feature_template.Default_Security_Cisco_V01.version,
      type = "cisco_security",
    },
    {
      id = sdwan_cisco_bfd_feature_template.Default_BFD_Cisco_V01.id,
      version = sdwan_cisco_bfd_feature_template.Default_BFD_Cisco_V01.version,
      type = "cisco_bfd",
    },
    {
      id = sdwan_cisco_system_feature_template.Global_System.id,
      version = sdwan_cisco_system_feature_template.Global_System.version,
      sub_templates = [
        {
          id = sdwan_cisco_logging_feature_template.Default_Logging_Cisco_V01.id,
          version = sdwan_cisco_logging_feature_template.Default_Logging_Cisco_V01.version,
          type = "cisco_logging",
        }
      ],
      type = "cisco_system",
    },
    {
      id = sdwan_cedge_global_feature_template.Default_EQUINIX_C8000V_GLOBAL_CISCO_V01.id,
      version = sdwan_cedge_global_feature_template.Default_EQUINIX_C8000V_GLOBAL_CISCO_V01.version,
      type = "cedge_global",
    },
    {
      id = sdwan_cedge_aaa_feature_template.Global_AAA.id,
      version = sdwan_cedge_aaa_feature_template.Global_AAA.version,
      type = "cedge_aaa",
    },
    {
      id = sdwan_cisco_banner_feature_template.Factory_Default_Retail_Banner.id,
      version = sdwan_cisco_banner_feature_template.Factory_Default_Retail_Banner.version,
      type = "cisco_banner",
    }
  ]
}
