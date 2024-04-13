# Sample code for Cisco SD-WAN 
Sample scripts.

## Pre-requirement for Python modules:
- "requests" library (install it with ```pip install requests```)

### SD-WAN Manager (vManage) credentials:

It is recommended to set enviromental variables:
- TF_VAR_MANAGER_ADDR - hostname or IP address of SD-WAN Manager (do not include https:// in front!)
- TF_VAR_MANAGER_USER - SD-WAN Manager user name
- TF_VAR_MANAGER_PASS - SD-WAN Manager user's password

If they are not defined, hostname of SD-WAN Manager is assumed to be manager.ciscopress.com, and credential will be asked interactively
