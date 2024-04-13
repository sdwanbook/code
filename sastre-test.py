import os, getpass 
from cisco_sdwan.base.rest_api import Rest
from cisco_sdwan.base.models_vmanage import DeviceControlConnections

device = "10.0.10.1"

manager = os.environ.get("MANAGER_ADDR") or "manager.ciscopress.com"
username = os.environ.get("MANAGER_USER") or input ("Username: ")
password = os.environ.get("MANAGER_PASS") or getpass.getpass('Password: ')

f0,f1,f2,f3,f4='peer_type','system_ip','local_color','remote_color','state'

with Rest(f"https://{manager}", username, password) as api:
    control_conns = DeviceControlConnections.get(api, deviceId=device)

    # self-documenting API: extract field descriptions from API response
    head=control_conns.field_info(f0, f1, f2, f3, f4)
    print(f"{head[0]:11}{head[1]:15}{head[2]:14}{head[3]:14}{head[4]}")

    # Iterate through control connections
    for row in control_conns.field_value_iter(f0, f1, f2, f3, f4):
        print(f"{row.peer_type:11}{row.system_ip:15}"
              f"{row.local_color:14}{row.remote_color:14}{row.state:5}")
