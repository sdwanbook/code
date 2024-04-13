import requests, getpass, os 

# Check enviromental variables for SD-WAN Manager details
# Use defaults if not defined
MANAGER_ADDR=os.environ.get("MANAGER_ADDR", "manager.ciscopress.com")
MANAGER_USER=os.environ.get("MANAGER_USER") or input ("Username: ")
MANAGER_PASS=os.environ.get("MANAGER_PASS") or getpass.getpass('Password: ')

# API URLs and data structures
base_url = f"https://{MANAGER_ADDR}"
base_api_url = base_url + "/dataservice"

login_url = base_url + "/j_security_check"
login_data = {"j_username": MANAGER_USER, "j_password": MANAGER_PASS}

def check_API_status (response):
    """ Helper function to check and print status after making API call """

    print ()
    print (f"Request:  HTTP {response.request.method} {response.url}")
    print (f"Response: HTTP code {response.status_code}")

    # Check for critical errors
    response.raise_for_status ()

# Initialize "Session" object from the "requests" library
session = requests.Session ()

# Disable TLS certificate warnings: do it for testing only
requests.packages.urllib3.disable_warnings()
session.verify = False

# Execute SD-WAN API Authentication call
response = session.post (url = login_url, data = login_data)
check_API_status (response)

if response.text == "":
    print ("Authenticated successfully, session ID: ")
    print (f"  {session.cookies['JSESSIONID']}")
else:
    print (f"Authentication failed")

