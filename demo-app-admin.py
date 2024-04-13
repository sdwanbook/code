import sdwan_api 

sample_user = {
    "userName": "demouser",
    "password": "demopassword",
    "description": "Demo User",
    "locale": "en_US",
    "group": ["netadmin"]
}

# Helper function for screen output
def print_users (users):
    for user in users['data']:
        username = user.get('userName','-')
        description = user.get('description','-')
        group = user.get('group','-')
        print (f"{username:15}{description:25}{group}")

# ----- start of the script -----
# Initialize API object
sdwan = sdwan_api.sdwan_api ()

# Print list of current users in the system
print_users (sdwan.api_GET ("/admin/user"))

# Add one more user and print user list to verify
sdwan.api_POST ("/admin/user", sample_user)
print_users (sdwan.api_GET ("/admin/user"))

# Change user group and print user list to verify
sample_user['group'] = ["operator"]
sdwan.api_PUT ("/admin/user/demouser", sample_user)
print_users (sdwan.api_GET ("/admin/user"))

# Finally, delete user and print user list to verify
sdwan.api_DELETE ("/admin/user/demouser")
print_users (sdwan.api_GET ("/admin/user"))

# Close session and exit
sdwan.logout ()
