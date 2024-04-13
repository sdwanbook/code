import sdwan_api 

def print_devices (devices):

    print (f"\n{'Name':12}{'System IP':12}{'Model':10}"
        f"{'Site':5}{'OS Ver':18}{'Template'}")

    for device in devices:
        dev_name = device.get('host-name','-')
        dev_ip = device.get('system-ip','-')
        dev_model = device.get('deviceModel','-').replace('vedge-','')
        dev_site = device.get('site-id','-')
        dev_ver = device.get('version','-')
        dev_tpl = device.get('template','-')

        print (f"{dev_name:12}{dev_ip:12}{dev_model:10}"
               f"{dev_site:5}{dev_ver:18}{dev_tpl}")

# ----- start of the script -----
# Initialize API object
sdwan = sdwan_api.sdwan_api ()

# Obtain data for controllers
controllers = sdwan.api_GET ("/system/device/controllers")['data']
# Obtain data for routers
wan_edges = sdwan.api_GET ("/system/device/vedges")['data']

# print inventory
print_devices (controllers)
print_devices (wan_edges)

# Close session and exit
sdwan.logout ()
