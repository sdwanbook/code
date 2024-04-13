import sdwan_api 

device = "10.0.10.1"

def print_interfaces (intf):

    print (f"Interface statistics for {intf[0].get('vdevice-host-name')} "
            f"({intf[0].get('vdevice-name')})")
    print (f"{'Name':20}{'VPN':6}{'IP Address':15}"
            f"{'Admin':6}{'Oper':6}{'TX octets':>12}{'RX octets':>12}")
    
    for int in intf:
        if int.get('ip-address') == '0.0.0.0':
            continue
        if_name = int.get('ifname','-')
        if_vpn = int.get('vpn-id','-')
        if_ip = int.get('ip-address','-')
        if_admin = int.get('if-admin-status','-').replace('if-state-','')
        if_oper = int.get('if-oper-status','-').replace('if-oper-state-','')
        if_tx = int.get('tx-octets','-')
        if_rx = int.get('rx-octets','-')

        print (f"{if_name:20}{if_vpn:6}{if_ip:15}"
                f"{if_admin:6}{if_oper:6}{if_tx:12}{if_rx:12}")

# ----- start of the script -----
# Initialize API object
sdwan = sdwan_api.sdwan_api ()

# Obtain real-time interface info
# Real-Time Monitoring - Interface
status = sdwan.api_GET (f"/device/interface/stats?deviceId={device}")['data']

# print interface data
print_interfaces (status)

# Close session and exit
sdwan.logout ()

