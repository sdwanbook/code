import requests, getpass, os, time 

class sdwan_api:
  def __init__ (self):

    manager = os.environ.get("MANAGER_ADDR") or "manager.ciscopress.com"
    username = os.environ.get("MANAGER_USER") or input ("Username: ")
    password = os.environ.get("MANAGER_PASS") or getpass.getpass('Password: ')

    self.base_url = f"https://{manager}"
    self.base_api_url = self.base_url + "/dataservice"
    self.session = requests.Session ()

    # Disable TLS certificate warnings: do it for testing only
    requests.packages.urllib3.disable_warnings()
    self.session.verify = False

    if not self.login (username, password):
      raise SystemExit (f'Login to {self.base_url} failed, exiting...')

  def login (self, username, password):
    login_url = self.base_url + "/j_security_check"
    token_url = self.base_api_url + "/client/token?json=true"
    login_data = {"j_username": username, "j_password": password}

    response = self.session.post(url=login_url, 
                   data=login_data, 
                   verify=False)
    response.raise_for_status ()

    # If authenticated, the response body is empty. 
    # If not, the response body contains a html login page
    if response.text:
      print ("Authentication Error")
      return False

    # session object contains the JSESSIONID cookie
    response = self.session.get(url=token_url, verify=False)
    response.raise_for_status ()

    try:
      self.session.headers['X-XSRF-TOKEN'] = response.json()['token']
      return True
    except:
      print ("Error obtaining XSRF Token")
      return False

  def logout (self):
    url = self.base_url + "/logout"

    # use "GET" action in versions <20.12
    response = self.session.post (url, {'nocache': str(time.time_ns())} )
    response.raise_for_status()

  def api_action (self, method, url, payload = {}):
    try:
      response = self.session.request (method=method, url=url, 
                       json=payload)
      response.raise_for_status()
    except:
      raise SystemExit (f"{method} request failed: {url},"
               f" code {response.status_code}")

    try:
      data = response.json()
    except:
      data = ""

    # comment to stop debugging:
    # print (f"\n>>> HTTP {method} {url}, status: {response.status_code}")
    # uncomment for more debugging:
    # if data:
    #   print (json.dumps(data, indent=4))

    return data

  def api_GET (self, path):
    response = self.api_action ("GET", self.base_api_url + path)
    return response

  def api_POST (self, path, payload):
    response = self.api_action ("POST", self.base_api_url+path, payload)
    return response

  def api_PUT (self, path, payload):
    response = self.api_action ("PUT", self.base_api_url+path, payload)
    return response

  def api_DELETE (self, path):
    response = self.api_action ("DELETE", self.base_api_url + path)
    return response
