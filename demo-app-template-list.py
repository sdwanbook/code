import sdwan_api 

target_template = "DC1_Edge"

# Helper function
def find_template_id (templates, name):
    """ Translate Name to ID """
    for template in templates:
        if template.get('templateName') == name:
            return template.get('templateId')
    return None

# Helper function
def find_template_name (templates, id):
    """ Translate ID to Name """
    for template in templates:
        if template.get('templateId') == id:
            return template.get('templateName')
    return None

def print_device_template (template, feature_templates): 
    print (f"\nDevice Template: {template.get('templateName')}")
    print (f"    Device Type: {template.get('deviceType','').replace('vedge-','')}")
    print (f"    Description: {template.get('templateDescription')}")
    print (f"Attached Feature Templates:")
    # Loop through template's feature templates
    for ftpl in template.get('generalTemplates'):
        
        ftpl_name = find_template_name (feature_templates, ftpl.get('templateId'))
        print (f"   {ftpl_name} ({ftpl.get('templateType')})")
        
        # Some templates have sub-templates, need another loop
        sub_ftpls = ftpl.get('subTemplates')
        if sub_ftpls:
            for sub_ftpl in sub_ftpls:
                sub_ftpl_name = find_template_name (feature_templates, sub_ftpl.get('templateId'))
                print (f"    - {sub_ftpl_name} ({sub_ftpl.get('templateType')})")
    
# ---------- start of the script ----------
# Initialize API object
sdwan = sdwan_api.sdwan_api ()

# Obtain a list of all device templates 
device_templates = sdwan.api_GET("/template/device")['data']
# Obtain a list of all feature templates 
feature_templates = sdwan.api_GET("/template/feature?summary=true")['data']

# Find template ID - needed for the next API call
target_template_id = find_template_id(device_templates, target_template)
# Obtain content of device template
template = sdwan.api_GET(f"/template/device/object/{target_template_id}")

print_device_template (template, feature_templates)

# Close session and exit
sdwan.logout ()
