import requests



def get_crumb(user, password):
    crumb_url = 'http://localhost:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)'
    resp = requests.get(crumb_url, auth=(user, password), verify=False)
    if resp.status_code == 200:
        return resp.text.split(":")[1]
    return None

def trigger_job(job_url, crumb):
    headers = {"Jenkins-Crumb": crumb}
    resp = requests.post(job_url, headers=headers, data={}, verify=False)
    print(resp.status_code)

user = "jenkins"
password = ""
job_url="http://localhost:8080/job/jenkin-tips-tricks/build?delay=0sec"
crumb = get_crumb(user, password)
if crumb:
    trigger_job(job_url, crumb)