import sdwan_api, time 

target_template = "DC1_Edge"

variables_request = {
    'templateId': '',
    'deviceIds': [],
    'isEdited': False,
    'isMasterEdited': False,
}

attach_request = {
  'deviceTemplateList': [
    {
      'templateId': '',
      'device': [],
      'isEdited': False,
      'isMasterEdited': False
    }
  ]
}

# Helper function
def find_template_id (templates, name):
    for template in templates:
        if template.get('templateName') == name:
            return template.get('templateId')
    return None

def wait_for_task(sdwan, task_id, interval=5, maxtime=60):
    """wait for async task until complete with 1 min timeout"""

    task_url = "/device/action/status/"+task_id
    time_elapsed = 0
    status = "unknown"

    while True:
        if (time_elapsed < maxtime):
            # read task status from vManage
            status_data = sdwan.api_GET(task_url)

            # current status of operation (in progress/success/fail)
            if len(status_data['data']) == 0:
                status = "Validation " + status_data.get("validation","").get("status","unknown error")
            else:
                status = status_data['summary']['status']

            # Stop when done
            if status == "done":
                print ("\nExecution log:")
                for rtr in status_data.get ('data'):
                    print (f"{rtr['host-name']}, status: {rtr['status']}")
                    for line in rtr['activity']:
                        print (line)
                    print ()
                break

            print (f"Operation in progress {time_elapsed}/{maxtime}s, status: {status}")
            time.sleep (interval)
            time_elapsed += interval
        else:
            status = "Timeout"
            break

    return status

# ---------- start of the script ----------
# Initialize API object
sdwan = sdwan_api.sdwan_api ()

# Find template ID - needed for the next API call
device_templates = sdwan.api_GET("/template/device")['data']
target_template_id = find_template_id(device_templates, target_template)

# Find all the devices attached to this template
attached_devices = sdwan.api_GET(f"/template/device/config/attached/{target_template_id}")['data']

# Prepare "variables_request" data structure to request current variables
print (f"Updating devices attached to the '{target_template}' template:")
variables_request['templateId'] = target_template_id
for rtr in attached_devices:
    variables_request['deviceIds'].append (rtr.get('uuid'))
    print (f" - {rtr.get('host-name')} ({rtr.get('deviceIP')})")

# Request device variables
device_variables = sdwan.api_POST("/template/device/config/input", variables_request)['data']

# Update values as needed
# In this case, we're updating interface description
for var in device_variables:
    var['/512/vpn512_if_name/interface/description'] = "Configured via API"

# Prepare "attach_request" data structure for the template push call
attach_request['deviceTemplateList'][0]['templateId'] = target_template_id
attach_request['deviceTemplateList'][0]['device'] = device_variables

# Template attach - asynchronous call, only returns task ID
task_id = sdwan.api_POST("/template/device/config/attachfeature", attach_request)['id']

# Patienly wait for the task to complete
status = wait_for_task(sdwan, task_id)

# Report the status
print(f"Task execution status: {status}")

# Close session and exit
sdwan.logout ()
